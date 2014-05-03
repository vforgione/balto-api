mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Sku = require './sku'


SkuQuantitySchema = new Schema {
  sku: { type: ObjectId, ref: Sku }
  on_shelf: Number
  in_carts: Number
  to_be_picked: Number
}

SkuQuantitySchema.virtual('available_for_sale').get ->
  @on_shelf - @in_carts - @to_be_picked


module.exports = mongoose.model 'SkuQuantity', SkuQuantitySchema
