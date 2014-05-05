Resource = require 'mangusu'

SkuQuantity = require '../schemas/sku_quantity'

SkuResource = require './sku_resource'


module.exports = new Resource SkuQuantity, 'sku-quantities', { refs: { sku: SkuResource } }
