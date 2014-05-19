FacebookStrategy = require 'passport-facebook'

User = require '../../schemas/user'


FACEBOOK_APP_ID = process.env.FACEBOOK_APP_ID or '229628103902729'
FACEBOOK_APP_SECRET = process.env.FACEBOOK_APP_SECRET or '9e5e36049eb8456a0df42129d4a5d888'
FACEBOOK_CALLBACK_URL = process.env.FACEBOOK_CALLBACK_URL or 'http://localhost:3000/auth/facebook/callback'


config = {
  clientID: FACEBOOK_APP_ID
  clientSecret: FACEBOOK_APP_SECRET
  callbackURL: FACEBOOK_CALLBACK_URL
  scope: [ 'public_profile', 'email' ]
}


module.exports = new FacebookStrategy config, (access_token, refresh_token, profile, done) ->
  process.nextTick ->
    User.findOne { '$or': [ { 'facebook.email': profile.email }, { 'google.email': profile.email }, { 'local.email': profile.email } ] }, (err, user) ->
      return done(err) if err
      if !user?
        user = new User()
      user.consume_facebook_profile(profile)
      user.save (err, user) ->
        throw new Error(err.message) if err
        return done(null, user)
