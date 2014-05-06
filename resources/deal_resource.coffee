Resource = require 'mangusu'

Deal = require '../schemas/deal'

OfferResource = require './offer_resource'
ProposalResource = require './proposal_resource'


module.exports = new Resource Deal, 'deals', { refs: { offers: OfferResource, proposal: ProposalResource } }
