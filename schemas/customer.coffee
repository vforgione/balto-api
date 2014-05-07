mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'


CustomerSchema = new Schema {
  name: { type: String, required: true }
  email: { type: String, required: true }
  address: {
    street1: String
    street2: String
    street3: String
    city: String
    state: String
    postal_code: String
    country: String }
  history: [ { type: ObjectId, ref: Diff } ]
}


module.exports = mongoose.model 'Customer', CustomerSchema
