respond = require('fulton').Responses

Group = require '../schemas/group'
User = require '../schemas/user'

GROUP_NAME = 'doggyloot'
GROUP_ID = null
Group.findOne { name: GROUP_NAME }, (err, group) ->
  throw new Error(err.message) if err
  return respond.not_found(res, GROUP_NAME) if !group?
  GROUP_ID = group.id


module.exports = (req, res) ->
  User.findOne { _id: req.user._id }, (err, user) ->
    throw new Error err.message if err
    return respond.unauthorized(res) if !user?
    for group in user.groups
      if group == GROUP_ID
        return true
    return false
