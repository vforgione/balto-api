Resource = require('fulton').Resource

SkuCost = require '../schemas/sku_cost'

DiffResource = require './diff_resource'
SkuResource = require './sku_resource'


module.exports = new Resource SkuCost, 'sku-costs', { refs: { history: DiffResource, sku: SkuResource } }
