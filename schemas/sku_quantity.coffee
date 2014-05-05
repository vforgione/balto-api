mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'
Sku = require './sku'


SkuQuantitySchema = new Schema {
  sku: { type: ObjectId, ref: Sku, required: true }
  on_shelf: { type: Number, required: true, default: 0 }
  in_carts: { type: Number, required: true, default: 0 }
  to_be_picked: { type: Number, required: true, default: 0 }
  history: [ { type: ObjectId, ref: Diff } ]
}

SkuQuantitySchema.virtual('available_for_sale').get ->
  @on_shelf - @in_carts - @to_be_picked


module.exports = mongoose.model 'SkuQuantity', SkuQuantitySchema
