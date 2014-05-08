Resource = require 'mangusu'

Sku = require '../schemas/sku'

BrandResource = require './brand_resource'
DiffResource = require './diff_resource'
VendorResource = require './vendor_resource'


module.exports = new Resource Sku, 'skus', { refs: {
  brand: BrandResource, history: DiffResource, 'vendors.vendor': VendorResource } }
