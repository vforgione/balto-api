Resource = require 'mangusu'

Sku = require '../schemas/sku'

BrandResource = require './brand_resource'
VendorResource = require './vendor_resource'


module.exports = new Resource Sku, 'skus', { refs: { brand: BrandResource, vendor: VendorResource } }
