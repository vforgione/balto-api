mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'
Offer = require './offer'
Proposal = require './proposal'


#STATES: [ 'In Development', 'Proposed', 'Rejected', 'Awaiting Shipment', 'Queued', 'Live', 'Done' ]


DealSchema = new Schema {
  title: { type: String, required: true }
  buyer: { type: String, required: true }
  proposal: { type: ObjectId, ref: Proposal }
  offers: [ { type: ObjectId, ref: Offer } ]
  text: String
  state: { type: String, required: true } #, enum: STATES }
  starts_on: Date
  ends_on: Date
  after_ends_do: String
  is_subscribable: { type: Boolean, required: true, default: false }
  customer_chooses: { type: Boolean, required: true, default: true }
  tags: [
    {
      internal: String
      public: String
    }
  ]
  images: [ String ]
  history: [ { type: ObjectId, ref: Diff } ]
}

DealSchema.virtual('price').get ->
  offers = [offer.price for offer in @offers]
  min = Math.min offers
  max = Math.max offers
  if min == max then "$#{min}"
  else "$#{min} - $#{max}"


module.exports = mongoose.model 'Deal', DealSchema
