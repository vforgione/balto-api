mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Customer = require './customer'
Diff = require './diff'
Product = require './product'


DogSchema = new Schema {
  name: { type: String, required: true }
  owner: { type: ObjectId, ref: Customer, required: true }
  breed: String
  birthday: Date
  weight: Number
  gender: { type: String, enum: ['M', 'F'] }
  favorites: [ { type: ObjectId, ref: Product } ]
  history: [ { type: ObjectId, ref: Diff } ]
}


module.exports = mongoose.model 'Dog', DogSchema
