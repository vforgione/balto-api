mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId
Mixed = Schema.Types.Mixed

Brand = require './brand'
Vendor = require './vendor'


SkuSchema = new Schema {
  number: { type: Number, required: true }
  name: { type: String, required: true }
  uom: {
    count: { type: Number, required: true, min: 1, default: 1 }
    unit_type: { type: String, required: true }
  }
  brand: { type: ObjectId, ref: Brand, required: true }
  vendors: [
    {
      vendor: { type: ObjectId, ref: Vendor }
      number: Number
    }
  ]
  tags: [
    {
      internal: String
      public: String
    }
  ]
  attributes: Mixed
  images: [ String ]
#  history: [ { type: ObjectId, ref: Diff } ]
}


module.exports = mongoose.model 'Sku', SkuSchema
