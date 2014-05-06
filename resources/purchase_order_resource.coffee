Resource = require 'mangusu'

PurchaseOrder = require '../schemas/purchase_order'

ContactResource = require './contact_resource'
DiffResource = require './diff_resource'
DealResource = require './deal_resource'
SkuResource = require './sku_resource'
WarehouseResource = require './warehouse_resource'


module.exports = new Resource PurchaseOrder, 'purchase-orders', { refs: {
  contact: ContactResource, destination: WarehouseResource, history: DiffResource, sku: SkuResource,
  deals: DealResource } }
