mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Diff = require './diff'


BrandSchema = new Schema {
  name: { type: String, required: true, unique: true }
  tags: [
    {
      internal: String
      public: String
    }
  ]
  history: [ { type: ObjectId, ref: Diff } ]
}


module.exports = mongoose.model 'Brand', BrandSchema
