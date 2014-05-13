mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'
Product = require './product'


OfferSchema = new Schema {
  products: [ {
    product: { type: ObjectId, ref: Product, required: true }
    quantity: { type: Number, required: true, min: 1, default: 1 }
    _id: false } ]
  weight: { type: Number, required: true, min: 1 }
  price: { type: Number, required: true }
  tags: [ {
    internal: String
    public: String
    _id: false } ]
  text: String
  images: [ String ]
  history: [ { type: ObjectId, ref: Diff } ]
}

OfferSchema.virtual('name').get ->
  pq = {}
  for p in @products
    pq[p.product] = p.quantity
  Product.find { _id : { $in: [p.product for p in @products] } }, (err, products) ->
    throw new Error err.message if err
    name = []
    for p in products
      qty = pq[p._id]
      name.push "#{qty} #{p.name}"
    name.join ', '

OfferSchema.virtual('available_for_sale').get ->
  pq = {}
  for p in @products
    pq[p.product] = p.quantity
  Product.find { _id : { $in: [p.product for p in @products] } }, (err, products) ->
    throw new Error err.message if err
    parseInt Math.min [ Math.floor(p.available_for_sale / pq[p._id]) for p in products ]


module.exports = mongoose.model('Offer', OfferSchema)
