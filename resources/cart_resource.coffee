Resource = require 'mangusu'

Cart = require '../schemas/cart'

CustomerResource = require './customer_resource'
DiffResource = require './diff_resource'
OfferResource = require './offer_resource'


module.exports = new Resource Cart, 'carts', { refs: {
  customer: CustomerResource, history: DiffResource, offers: OfferResource } }
