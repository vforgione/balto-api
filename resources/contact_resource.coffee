Resource = require 'mangusu'

Contact = require '../schemas/contact'

VendorResource = require './vendor_resource'


module.exports = new Resource Contact, 'contacts', { refs: { represents: VendorResource } }
