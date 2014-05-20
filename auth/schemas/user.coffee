bcrypt = require 'bcrypt-nodejs'

mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Role = require './role'


UserSchema = new Schema {
  roles: [ { type: ObjectId, ref: Role } ]
  local: {
    email: String
    password: String
    salt: String
    _id: false
  }
  facebook: {
    first_name: String
    last_name: String
    email: String
    _id: false
  }
  google: {
    first_name: String
    last_name: String
    email: String
    _id: false
  }
}

# facebook store
UserSchema.methods.consume_facebook = (profile) ->
  profile = JSON.parse(JSON.stringify(profile))._json
  @facebook.first_name = profile.first_name
  @facebook.last_name = profile.last_name
  @facebook.email = profile.email

# google store
UserSchema.methods.consume_google = (profile) ->
  profile = JSON.parse(JSON.stringify(profile))._json
  @google.first_name = profile.first_name
  @google.last_name = profile.last_name
  @google.email = profile.email

# local store
UserSchema.methods.generate_salt = ->
  bcrypt.genSaltSync()

UserSchema.methods.hash_password = (plaintext) ->
  bcrypt.hashSync(plaintext, @local.salt)

UserSchema.methods.validate_password = (plaintext) ->
  @hash_password(plaintext) == @local.password

UserSchema.methods.consume_local = (email, password) ->
  @local.email = email
  @local.salt = @generate_salt()
  @local.password = @hash_password(password)


module.exports = mongoose.model('User', UserSchema)
