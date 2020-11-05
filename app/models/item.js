const mongoose = require('mongoose')

const itemSchema = new mongoose.Schema({
  itemName: {
    type: String,
    required: true
  },
  itemClass: {
    type: String,
    required: true
  },
  costPerUnit: {
    type: String,
    required: true
  },
  pricePerUnit: {
    type: String,
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
