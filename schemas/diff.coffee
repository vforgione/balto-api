mongoose = require 'mongoose'
Schema = mongoose.Schema
Mixed = Schema.Types.Mixed


DiffSchema = new Schema {
  date: { type: Date, required: true, default: Date.now }
  who: String
  changes: [
    {
      field: { type: String, required: true }
      old: { type: Mixed, required: true }
      new: { type: Mixed, required: true }
    }
  ]
}


module.exports = mongoose.model 'Diff', DiffSchema
