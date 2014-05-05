Resource = require 'mangusu'

Product = require '../schemas/product'

SkuResource = require './sku_resource'


module.exports = new Resource Product, 'products', { refs: { sku: SkuResource } }
