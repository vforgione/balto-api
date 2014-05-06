Resource = require 'mangusu'

SkuQuantity = require '../schemas/sku_quantity'

DiffResource = require './diff_resource'
SkuResource = require './sku_resource'


module.exports = new Resource SkuQuantity, 'sku-quantities', { refs: { history: DiffResource, sku: SkuResource } }
