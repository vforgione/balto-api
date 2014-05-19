express = require 'express'

body_parser = require 'body-parser'
cookies = require 'cookie-parser'
logging = require 'morgan'
method_override = require 'method-override'
session = require 'express-session'

SESSION_SECRET = process.env.SECRET or 'vince is awesome'

app = express()
app.set 'port', process.env.PORT or 3000
app.use logging()
app.use cookies()
app.use body_parser()
app.use method_override()
app.use session({secret: SESSION_SECRET})


module.exports = app
