mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Product = require './product'


OfferSchema = new Schema {
  products: [{
    product: { type: ObjectId, ref: Product }
    qty: Number
  }]
  weight: Number
  price: Number
}

OfferSchema.virtual('name').get ->
  [prod.name for prod in @products].join ', '

OfferSchema.virtual('available_for_sale').get ->
  Math.min [ Math.floor(prod.product.available_for_sale / prod.qty) for prod in @products ]


module.exports = mongoose.model 'Offer', OfferSchema
