Resource = require 'mangusu'

SkuCost = require '../schemas/sku_cost'

SkuResource = require './sku_resource'


module.exports = new Resource SkuCost, 'sku-costs', { refs: { sku: SkuResource } }
