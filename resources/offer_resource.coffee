Resource = require 'mangusu'

Offer = require '../schemas/offer'

ProductResource = require './product_resource'


module.exports = new Resource Offer, 'offers', { refs: { products: ProductResource } }
