Resource = require 'mangusu'

Proposal = require '../schemas/proposal'

ProductResource = require './product_resource'
VendorResource = require './vendor_resource'


module.exports = new Resource Proposal, 'proposals', { refs: {
  products: ProductResource, vendor: VendorResource } }
