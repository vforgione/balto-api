GoogleStrategy = require('passport-google').Strategy

User = require '../../schemas/user'


GOOGLE_CLIENT_ID = process.env.GOOGLE_CLIENT_ID or '190361582361-se9sl6uu92pdtiacje2ljm4e7to0ps8g.apps.googleusercontent.com'
GOOGLE_CLIENT_SECRET = process.env.GOOGLE_CLIENT_SECRET or 'sUQxSD-7XeVf0rz4mflRlzD-'
GOOGLE_RETURN_URL = process.env.GOOGLE_RETURN_URL or 'http://localhost:3000/auth/google/callback'


config = {
  clientID: GOOGLE_CLIENT_ID
  clientSecret: GOOGLE_CLIENT_SECRET
  returnURL: GOOGLE_RETURN_URL
}


module.exports = new GoogleStrategy config, (identifier, profile, done) ->
  process.nextTick ->
    email = profile.emails[0].value
    User.findOne { '$or': [ { 'facebook.email': email }, { 'google.email': email }, { 'local.email': email } ] }, (err, user) ->
      return done(err) if err
      if !user?
        user = new User()
      user.consume_google_profile(profile)
      user.save (err, user) ->
        throw new Error(err.message) if err
        return done(null, user)
