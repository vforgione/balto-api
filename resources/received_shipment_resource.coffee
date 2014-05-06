Resource = require 'mangusu'

ReceivedShipment = require '../schemas/received_shipment'

DiffResource = require './diff_resource'
SkuResource = require './sku_resource'
PurchaseOrderResource = require './purchase_order_resource'


module.exports = new Resource ReceivedShipment, 'received-shipments', { refs: {
  history: DiffResource, purchase_order: PurchaseOrderResource, sku: SkuResource } }
