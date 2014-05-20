respond = require('fulton').Responses


module.exports.serialize_user = (user, done) ->
  done null, user


module.exports.deserialize_user = (obj, done) ->
  done null, obj


module.exports.simple_authentication = (redirect) ->
  (req, res, next) ->
    if req.isAuthenticated()
      return next()
    else
      return respond.redirect(res, redirect)
