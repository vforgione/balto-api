mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Offer = require './offer'


DealSchema = new Schema {
  offers: [{ type: ObjectId, ref: Offer }]
  text: String
}


module.exports = mongoose.model 'Deal', DealSchema
