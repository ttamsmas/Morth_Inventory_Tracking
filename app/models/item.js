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
  price: {
    type: Number,
    default: function () {
      return this.cost * 2
    }
  },
  created: {
    type: String,
    get: dateCreated => {
      let created = new Date(dateCreated)
      let today = new Date()
      let ageCalc = today.getTime() - created.getTime()
      let agePretty = Math.floor(ageCalc / (1000 * 3600 * 24) / 365 )
      return age
    },
    set: age => age,
    alias: 'age'
  },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, {
  timestamps: true
})

module.exports = mongoose.model('Item', itemSchema)
