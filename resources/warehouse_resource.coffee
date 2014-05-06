Resource = require 'mangusu'

Warehouse = require '../schemas/warehouse'

DiffResource = require './diff_resource'


module.exports = new Resource Warehouse, 'warehouses', { refs: { history: DiffResource } }
