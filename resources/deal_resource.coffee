Resource = require 'mangusu'

Deal = require '../schemas/deal'

DiffResource = require './diff_resource'
OfferResource = require './offer_resource'
ProposalResource = require './proposal_resource'


module.exports = new Resource Deal, 'deals', { refs: { history: DiffResource, offers: OfferResource, proposal: ProposalResource } }
