Resource = require('fulton').Resource

Contact = require '../schemas/contact'

DiffResource = require './diff_resource'
VendorResource = require './vendor_resource'


module.exports = new Resource Contact, 'contacts', { refs: { history: DiffResource, represents: VendorResource } }
