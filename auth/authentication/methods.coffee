check_authentication = (req, res, next) ->
  if req.isAuthenticated()
    return next()
  else
    res.redirect('/login')


serialize_user = (user, done) ->
  done(null, user)


deserialize_user = (obj, done) ->
  done(null, obj)


module.exports.check_authentication = check_authentication
module.exports.serialize_user = serialize_user
module.exports.deserialize_user = deserialize_user
