Resource = require 'mangusu'

Deal = require '../schemas/deal'

OfferResource = require './offer_resource'


module.exports = new Resource Deal, 'deals', { refs: { offers: OfferResource } }
