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
  price: { // price should be a virtual function determined by the cost
    type: Number,
    required: true
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
