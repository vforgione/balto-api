mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId


VendorSchema = new Schema {
  name: { type: String, required: true, unique: true }
#  history: [ { type: ObjectId, ref: Diff } ]
}


module.exports = mongoose.model 'Vendor', VendorSchema
