mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'
Sku = require './sku'
PurchaseOrder = require './purchase_order'


ReceivedShipmentSchema = new Schema {
  received_by: { type: String, required: true }
  purchase_order: { type: ObjectId, ref: PurchaseOrder, required: true }
  date: { type: Date, rquired: true, defualt: Date.now }
  note: String
  line_items: [{
    sku: { type: ObjectId, ref: Sku, required: true }
    qty: { type: Number required: true, min: 0 }
  }]
  history: { type: ObjectId, ref: Diff }
}


module.exports = mongoose.model 'ReceivedShipment', ReceivedShipmentSchema
