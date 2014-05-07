mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'


WarehouseSchema = new Schema {
  name: { type: String, required: true }
  address: {
    street1: { type: String, required: true }
    street2: String
    street3: String
    city: { type: String, required: true }
    state: { type: String, required: true }
    postal_code: { type: String, required: true }
    country: String }
  history: [ { type: ObjectId, ref: Diff } ]
}


module.exports = mongoose.model 'Warehouse', WarehouseSchema
