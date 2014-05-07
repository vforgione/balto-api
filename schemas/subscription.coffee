mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Customer = require './customer'
Diff = require './diff'
Offer = require './offer'


SubscriptionSchema = new Schema {
  customer: { type: ObjectId, ref: Customer, required: true }
  offer: { type: ObjectId, ref: Offer, required: true }
  active: { type: Boolean, required: true, default: true }
  starts_on: { type: Date, required: true }
  ends_on: { type: Date, required: true }
  cadence: { type: Number, required: true, min: 1 }
  interval: { type: String, required: true, enum: ['Day', 'Week', 'Month'] }
  history: [ { type: ObjectId, ref: Diff } ]
}


module.exports = mongoose.model 'Subscription', SubscriptionSchema
