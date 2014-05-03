mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Product = require './product'


OfferSchema = new Schema {
  products: [{
    product: { type: ObjectId, ref: Product, required: true }
    qty: { type: Number, required: true, min: 1, default: 1 }
  }]
  weight: { type: Number, required: true }
  price: { type: Number, required: true }
  tags: [
    {
      internal: String
      public: String
    }
  ]
  text: String
  images: [ String ]
#  history: [ { type: ObjectId, ref: Diff } ]
}

OfferSchema.virtual('name').get ->
  [prod.name for prod in @products].join ', '

OfferSchema.virtual('available_for_sale').get ->
  Math.min [ Math.floor(prod.product.available_for_sale / prod.qty) for prod in @products ]


module.exports = mongoose.model 'Offer', OfferSchema
