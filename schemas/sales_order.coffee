mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Cart = require './cart'
Diff = require './diff'


SalesOrderSchema = new Schema {
  cart: { type: ObjectId, ref: Cart, required: true }
  state: { type: String, required: true }
  tax: Number
  history: [ { type: ObjectId, ref: Diff } ]
}

SalesOrderSchema.virtual('total').get ->
  Cart.findById @cart, (err, cart) ->
    throw new Error err.message if err
    subtotal = cart.subtotal
    if @tax?
      tax_rate = parseFloat @tax / 100
    else
      tax_rate = 0
    tax_amount = subtotal * tax_rate
    subtotal + tax_amount


module.exports = mongoose.model 'SalesOrder', SalesOrderSchema
