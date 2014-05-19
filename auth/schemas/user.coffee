bcrypt = require 'bcrypt-nodejs'

mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Group = require './group'


UserSchema = new Schema {
  groups: [ { type: ObjectId, ref: Group } ]
  facebook: {
    _id: false
    id: String
    email: String
    username: String
    first_name: String
    last_name: String
    gender: String
    timezone: String
  }
  google: {
    _id: false
    username: String
    first_name: String
    last_name: String
    email: String
  }
  local: {
    _id: false
    email: String
    password: String
    salt: String
  }
}

# local stuff
UserSchema.methods.generate_salt = ->
  bcrypt.genSaltSync()

UserSchema.methods.hash_password = (plaintext) ->
  bcrypt.hashSync(plaintext, @local.salt)

UserSchema.methods.validate_password = (plaintext) ->
  encrypted = bcrypt.hashSync(plaintext, @local.salt)
  encrypted == @local.password

UserSchema.methods.consume_local_profile = (email, password) ->
  @local.email = email
  @local.salt = @generate_salt()
  @local.password = @hash_password(password)

# facebook stuff
UserSchema.methods.consume_facebook_profile = (callback_data) ->
  cbd = JSON.parse JSON.stringify(callback_data)
  profile = cbd._json
  @facebook.id = profile.id
  @facebook.email = profile.email
  @facebook.username = profile.name
  @facebook.first_name = profile.first_name
  @facebook.last_name = profile.last_name
  @facebook.gender = profile.gender
  @facebook.timezone = profile.timezone

# google stuff
UserSchema.methods.consume_google_profile = (callback_data) ->
  cbd = JSON.parse JSON.stringify(callback_data)
  @google.username = cbd.displayName
  @google.first_name = cbd.name.givenName
  @google.last_name = cbd.name.familyName
  @google.email = cbd.emails[0].value


module.exports = mongoose.model 'User', UserSchema
