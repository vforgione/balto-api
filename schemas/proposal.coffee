mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'
Product = require './product'
Vendor = require './vendor'


ProposalSchema = new Schema {
  buyer: { type: String, required: true }
  state: { type: String, required: true, enum: ['Queued', 'Accepted', 'Rejected'] }
  title: { type: String, required: true }
  revenue: { type: Number, required: true }
  cogs: { type: Number, required: true }
  price: { type: Number, required: true }
  msrp: { type: Number, required: true }
  tags: [ String ]
  vendor: { type: ObjectId, ref: Vendor, required: true }
  products: [ { type: ObjectId, ref: Product, required: true } ]
  history: [ { type: ObjectId, ref: Diff, required: true } ]
}


module.exports = mongoose.model('Proposal', ProposalSchema)
