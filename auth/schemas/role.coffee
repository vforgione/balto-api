mongoose = require 'mongoose'
Schema = mongoose.Schema


RoleSchema = new Schema {
  name: { type: String, required: true, unique: true }
  description: String
}


module.exports = mongoose.model('Role', RoleSchema)
