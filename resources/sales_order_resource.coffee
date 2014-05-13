Resource = require('fulton').Resource

SalesOrder = require '../schemas/sales_order'

CartResource = require './cart_resource'
DiffResource = require './diff_resource'


module.exports = new Resource SalesOrder, 'sales-orders', { refs: { cart: CartResource, history: DiffResource } }
