LocalStrategy = require('passport-local').Strategy

User = require '../../schemas/user'


config = {
  usernameField: 'email'
  passwordField: 'password'
  passReqToCallback: true
}


module.exports.local_strategy = new LocalStrategy config, (req, email, password, done) ->
  User.findOne { '$or': [ { 'facebook.email': email }, { 'google.email': email }, { 'local.email': email } ] }, (err, user) ->
    return done(err) if err
    if user?
      if user.validate_password(password)
        return done(null, user)
      else
        return done(null, false)
    else
      return done(null, false)

module.exports.local_signup = new LocalStrategy config, (req, email, password, done) ->
  User.findOne { '$or': [ { 'facebook.email': email }, { 'google.email': email }, { 'local.email': email } ] }, (err, user) ->
    return done(err) if err
    if user? and user.local?
      return done(null, false, req.flash('sign_up', 'Email already in use.'))
    else
      user = new User()
    user.consume_local_profile(email, password)
    user.save (err, user) ->
      return done(err) if err
      return done(null, user)
