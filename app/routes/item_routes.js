// Express docs: http://expressjs.com/en/api.html
const express = require('express')
// Passport docs: http://www.passportjs.org/docs/
const passport = require('passport')

// pull in Mongoose model for items
const Item = require('../models/item')

// Catch pushes errors to a waterfall of custom error messages
const customErrors = require('../../lib/custom_errors')

// Error for Non-Existant Doc Request
const handle404 = customErrors.handle404
// we'll use this function to send 401 when a user tries to modify a resource
// that's owned by someone else
const requireOwnership = customErrors.requireOwnership

// this is middleware that will remove blank fields from `req.body`, e.g. { item: { title: '', text: 'foo' } } -> { item: { text: 'foo' } }
const removeBlanks = require('../../lib/remove_blank_fields')
// passing this as a second argument to `router.<verb>` will make it
// so that a token MUST be passed for that route to be available
// it will also set `req.user`
const requireToken = passport.authenticate('bearer', { session: false })

// instantiate a router (mini app that only handles routes)
const router = express.Router()

// INDEX / GET / Show All
router.get('/items', requireToken, (req, res, next) => {
  Item.find()
    .populate('owner')
    .populate('items.owner')
    .then(items => {
    return items.map(item => item.toObject())
    })
    .then(items => res.status(200).json({ items }))
    .catch(next)
})

// SHOW / GETONE
router.get('/items/:id', requireToken, (req, res, next) => {
  // req.params.id will be set based on the `:id` in the route
  Item.findById(req.params.id)
    .then(handle404)
    // if `findById` is succesful, respond with 200 and "item" JSON
    .then(item => res.status(200).json({ item: item.toObject() }))
    // if an error occurs, pass it to the handler
    .catch(next)
})

// POST / CREATE AN ITEM
router.post('/items', requireToken, (req, res, next) => {
  // set owner of new item to be the user signed in user
  req.body.items.owner[0] = req.user.id
  Item.create(req.body.item)
    // respond to succesful `create` with status 201 and JSON of new "item"
    .then(item => {
      res.status(201).json({ item: item })
    })
    // if an error occurs, pass it off to our error handler
    // the error handler needs the error message and the `res` object so that it
    // can send an error message back to the client
    .catch(next)
})

// UPDATE / PATCH
router.patch('/items/:id', requireToken, removeBlanks, (req, res, next) => {
  delete req.body.item.owner
  Item.findById(req.params.id)
    .then(handle404)
    .then(item => {
      requireOwnership(req, item)
      return item.updateOne(req.body.item)
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

// DESTROY / DELETE
// Not the same thing as remove quantity (patch)
router.delete('/items/:id', requireToken, (req, res, next) => {
  Item.findById(req.params.id)
    .then(handle404)
    .then(item => {
      // throw an error if current user doesn't own `item`
      requireOwnership(req, item)
      // delete the item ONLY IF the above didn't throw
      item.deleteOne()
    })
    // send back 204 and no content if the deletion succeeded
    .then(() => res.sendStatus(204))
    // if an error occurs, pass it to the handler
    .catch(next)
})

module.exports = router
