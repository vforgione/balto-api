mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'
PurchaseOrder = require './purchase_order'
Sku = require './sku'


ReceivedShipmentSchema = new Schema {
  received_by: { type: String, required: true }
  purchase_order: { type: ObjectId, ref: PurchaseOrder, required: true }
  date: { type: Date, required: true, default: Date.now }
  note: String
  line_items: [ {
    sku: { type: ObjectId, ref: Sku, required: true }
    quantity: { type: Number required: true, min: 0 }
    _id: false } ]
  history: { type: ObjectId, ref: Diff }
}


module.exports = mongoose.model 'ReceivedShipment', ReceivedShipmentSchema
