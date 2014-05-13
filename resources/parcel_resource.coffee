Resource = require('fulton').Resource

Parcel = require '../schemas/parcel'

DiffResource = require './diff_resource'
ProductResource = require './product_resource'
SalesOrderResource = require './sales_order_resource'
WarehouseResource = require './warehouse_resource'


module.exports = new Resource Parcel, 'parcels', { refs: {
  history: DiffResource, origin: WarehouseResource, products: ProductResource, sales_order: SalesOrderResource } }
