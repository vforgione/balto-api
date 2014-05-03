mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Sku = require './sku'
SkuQuantity = require './sku_quantity'


ProductSchema = new Schema {
  sku: { type: ObjectId, ref: Sku, required: true }
  skus_per: { type: Number, min: 1, required: true, default: 1 }
  uom: {
    count: { type: Number, required: true, min: 1, default: 1 }
    unit_type: { type: String, required: true }
  }
#  history: [ { type: ObjectId, ref: Diff } ]
}

ProductSchema.virtual('name').get ->
  @sku.name

ProductSchema.virtual('available_for_sale').get ->
  SkuQuantity.find { sku: @sku._id }, (err, sq) ->
    throw new Error(err.message) if err
    Math.floor sq.available_for_sale / @skus_per


module.exports = mongoose.model 'Product', ProductSchema
