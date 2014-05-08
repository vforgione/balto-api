mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'
Product = require './product'
SalesOrder = require './sales_order'
Warehouse = require './warehouse'


ParcelSchema = new Schema {
  sales_order: { type: ObjectId, ref: SalesOrder, required: true }
  products: [ { type: ObjectId, ref: Product, required: true } ]
  carrier: { type: String, required: true }
  tracking_url: String
  destination: {
    street1: String
    street2: String
    street3: String
    city: String
    state: String
    postal_code: String
    country: String
    _id: false }
  origin: { type: ObjectId, ref: Warehouse, required: true }
  history: [ { type: ObjectId, ref: Diff } ]
}


module.exports = mongoose.model 'Parcel', ParcelSchema
