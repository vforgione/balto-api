Resource = require('fulton').Resource

Dog = require '../schemas/dog'

CustomerResource = require './customer_resource'
DiffResource = require './diff_resource'
ProductResource = require './product_resource'


module.exports = new Resource Dog, 'dogs', { refs: {
  favorites: ProductResource, history: DiffResource, owner: CustomerResource}}
