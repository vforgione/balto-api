Resource = require 'mangusu'

Proposal = require '../schemas/proposal'

DiffResource = require './diff_resource'
ProductResource = require './product_resource'
VendorResource = require './vendor_resource'


module.exports = new Resource Proposal, 'proposals', { refs: {
  history: DiffResource, products: ProductResource, vendor: VendorResource } }
