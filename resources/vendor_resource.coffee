Resource = require('fulton').Resource

Vendor = require '../schemas/vendor'

DiffResource = require './diff_resource'


module.exports = new Resource Vendor, 'vendors', { refs: { history: DiffResource } }
