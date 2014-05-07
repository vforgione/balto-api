mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'
Sku = require './sku'


SkuCostSchema = new Schema {
  sku: { type: ObjectId, ref: Sku, required: true }
  costs: [ {
    cost: { type: Number, required: true, default: 0 }
    quantity: { type: Number, required: true, default: 1 }
    date: { type: Date, required: true, default: Date.now } } ]
  position: { type: Number, required: true, default: 0 }
  history: [ { type: ObjectId, ref: Diff } ]
}


module.exports = mongoose.model 'SkuCost', SkuCostSchema
