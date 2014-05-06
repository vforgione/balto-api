Resource = require 'mangusu'

PurchaseOrder = require '../schemas/purchase_order'

ContactResource = require './contact_resource'
DealResource = require './deal_resource'
SkuResource = require './sku_resource'
WarehouseResource = require './warehouse_resource'


module.exports = new Resource PurchaseOrder, 'purchase-orders', { refs: {
  contact: ContactResource, destination: WarehouseResource, sku: SkuResource, deals: DealResource } }
