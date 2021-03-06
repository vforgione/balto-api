mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId
Mixed = Schema.Types.Mixed

Diff = require './diff'
Brand = require './brand'
Vendor = require './vendor'


SkuSchema = new Schema {
  number: { type: Number, required: true, min: 1 }
  name: { type: String, required: true }
  brand: { type: ObjectId, ref: Brand, required: true }
  vendors: [ {
    vendor: { type: ObjectId, ref: Vendor }
    vendor_sku_number: String
    _id: false } ]
  tags: [ {
    internal: String
    public: String
    _id: false } ]
  attributes: Mixed
  images: [ String ]
  history: [ { type: ObjectId, ref: Diff } ]
}


module.exports = mongoose.model('Sku', SkuSchema)
