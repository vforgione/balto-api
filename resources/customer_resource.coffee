Resource = require('fulton').Resource

Customer = require '../schemas/customer'

DiffResource = require './diff_resource'


module.exports = new Resource Customer, 'customers', { refs: { history: DiffResource } }
