mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Offer = require './offer'


#STATES: [ 'In Development', 'Proposed', 'Rejected', 'Awaiting Shipment', 'Queued', 'Live', 'Done' ]


DealSchema = new Schema {
  title: { type: String, required: true }
  offers: [{ type: ObjectId, ref: Offer }]
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
#  history: [ { type: ObjectId, ref: Diff } ]
}

DealSchema.virtual('price').get ->
  min = Math.min [offer.price for offer in @offers]
  max = Math.max [offer.price for offer in @offers]
  if min == max then "$#{min}"
  else "$#{min} - $#{max}"


module.exports = mongoose.model 'Deal', DealSchema
