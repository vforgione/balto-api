mongoose = require 'mongoose'
Schema = mongoose.Schema


GroupSchema = new Schema {
  name: { type: String, required: true }
  description: String
}


module.exports = mongoose.model 'Group', GroupSchema
