Resource = require 'mangusu'

Brand = require '../schemas/brand'

DiffResource = require './diff_resource'


module.exports = new Resource Brand, 'brands', { refs: { history: DiffResource } }
