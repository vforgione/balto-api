mongoose = require 'mongoose'
Schema = mongoose.Schema


SkuSchema = new Schema {
  number: Number
  name: String
  uom: {
    count: Number
    unit_type: String
  }
}


module.exports = mongoose.model 'Sku', SkuSchema
