Resource = require 'mangusu'

Offer = require '../schemas/offer'

DiffResource = require './diff_resource'
ProductResource = require './product_resource'


module.exports = new Resource Offer, 'offers', { refs: { history: DiffResource, 'products.product': ProductResource } }
