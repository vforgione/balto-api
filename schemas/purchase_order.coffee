mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Contact = require './contact'
Diff = require './diff'
Deal = require './deal'
Sku = require './sku'
Warehouse = require './warehouse'


PurchaseOrderSchema = new Schema {
  creator: { type: String, required: true }
  contact: { type: ObjectId, ref: Contact, required: true }
  destination: { type: ObjectId, ref: Warehouse, required: true }
  date: { type: Date, required: true, default: Date.now }
  terms: { type: String, required: true }
  note: String
  tax: Number
  shipping: Number
  discount: String
  tracking_url: String
  deals: [ { type: ObjectId, ref: Deal } ]
  line_items: [{
    sku: { type: ObjectId, ref: Sku, required: true }
    qty: { type: Number, required: true }
    unit_price: { type: Number, required: true }
    discount: String
  }]
  history: [ { type: ObjectId, ref: Diff } ]
}

PurchaseOrderSchema.virtual('total').get ->
  li_total = 0
  for li in @line_items
    line = li.qty * li.unit_price
    if li.discount? and li.discount.length
      if '%' in li.discount
        disc = parseFloat li.discount / 100
        line -= line * disc
      else
        disc = parseFloat li.discount
        line -= disc
    li_total += line
  subtotal = li_total + @shipping
  if @discount? and @discount.length
    if '%' in @discount
      disc = parseFloat @discount / 100
      subtotal -= subtotal * disc
    else
      disc = parseFloat @discount
      subtotal -= disc
  tax_rate = parseFloat @tax / 100
  tax_cost = subtotal * tax_rate
  subtotal + tax_cost


module.exports = mongoose.model 'PurchaseOrder', PurchaseOrderSchema
