mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Customer = require './customer'
Diff = require './diff'
Offer = require './offer'


CartSchema = new Schema {
  customer: { type: ObjectId, ref: Customer, required: true }
  checked_out: { type: Boolean, required: true, default: false }
  offers: [ { type: ObjectId, ref: Offer, required: true } ]
  history: [ { type: ObjectId, ref: Diff } ]
}

CartSchema.virtual('subtotal').get ->
  Offer.find { _id: { $in: @offers } }, (err, offers) ->
    throw new Error err.message if err
    offers.reduce (t, s) ->
      t.price + s.price


module.exports = mongoose.model('Cart', CartSchema)
