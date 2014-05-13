Resource = require('fulton').Resource

Subscription = require '../schemas/subscription'

CustomerResource = require './customer_resource'
DiffResource = require './diff_resource'
OfferResource = require './offer_resource'


module.exports = new Resource Subscription, 'subscriptions', { refs: {
  customer: CustomerResource, history: DiffResource, offer: OfferResource } }
