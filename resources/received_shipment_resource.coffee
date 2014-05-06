Resource = require 'mangusu'

ReceivedShipment = require '../schemas/received_shipment'

SkuResource = require './sku_resource'
PurchaseOrderResource = require './purchase_order_resource'


module.exports = new Resource ReceivedShipment, 'received-shipments', { refs: {
  purchase_order: PurchaseOrderResource, sku: SkuResource } }
