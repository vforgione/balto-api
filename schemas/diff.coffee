mongoose = require 'mongoose'
Schema = mongoose.Schema
Mixed = Schema.Types.Mixed

###
  really just a wrapper around the deep-diff.diff output that's emitted on change
###
DiffSchema = new Schema {
  date: { type: Date, required: true, default: Date.now }
  who: String
  changes: { type: Mixed, required: true }
}


module.exports = mongoose.model 'Diff', DiffSchema
