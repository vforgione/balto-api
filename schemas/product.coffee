mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'
Sku = require './sku'
SkuQuantity = require './sku_quantity'


ProductSchema = new Schema {
  sku: { type: ObjectId, ref: Sku, required: true }
  skus_per: { type: Number, min: 1, required: true, default: 1 }
  history: [ { type: ObjectId, ref: Diff } ]
}

ProductSchema.virtual('name').get ->
  Sku.findById @sku, (err, sku) ->
    throw new Error err.message if err
    sku.name

ProductSchema.virtual('available_for_sale').get ->
  SkuQuantity.findOne { sku: @sku }, (err, sq) ->
    throw new Error(err.message) if err
    parseInt Math.floor sq.available_for_sale / @skus_per


module.exports = mongoose.model('Product', ProductSchema)
