Resource = require 'mangusu'

Product = require '../schemas/product'

DiffResource = require './diff_resource'
SkuResource = require './sku_resource'


module.exports = new Resource Product, 'products', { refs: { history: DiffResource, sku: SkuResource } }
