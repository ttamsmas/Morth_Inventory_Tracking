'use strict'

const mongoose = require('mongoose')

const itemSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  department: { // I think you can setup an array of responses to limit the results received
    type: String
  },
  quantity: {
    type: Number,
    required: true
  },
  cost: {
    type: Number,
    required: true
    },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, ret, options) {
      const userId = (options.user && options.user._id) || false
      ret.editable = userId && userId.equals(doc._owner)
      return ret
    }
  }
})

itemSchema.virtual('price').get(function price () {
  return this.cost * 2
})

module.exports = mongoose.model('Item', itemSchema)
