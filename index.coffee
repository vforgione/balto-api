# new relic monitoring
require 'newrelic'


# response methods
respond = require('fulton').Responses


# application import
app = require './app'


# connect to database
mongoose = require 'mongoose'
mongoose.connect process.env.MONGOHQ_URL or 'mongodb://localhost:27017/balto-api-dev'


# import passport
passport = require 'passport'

# passport initialization
serialize_user = require('./auth/authentication/methods').serialize_user
deserialize_user = require('./auth/authentication/methods').deserialize_user

facebook_strategy = require('./auth/authentication/facebook_strategy')
google_strategy = require('./auth/authentication/google_strategy')

passport.serializeUser serialize_user
passport.deserializeUser deserialize_user
passport.use facebook_strategy
passport.use google_strategy

# passport utilization
app.use passport.initialize()
app.use passport.session()


# authentication routes
app.get '/login', (req, res) ->
  respond.ok res, { facebook: '/auth/facebook', google: '/auth/google' }

app.get '/auth/facebook', passport.authenticate('facebook'), (req, res) ->

app.get '/auth/facebook/callback', passport.authenticate('facebook', { failureRedirect: '/login' }), (req, res) ->
  respond.ok res, req.user

app.get '/auth/google', passport.authenticate('google'), (req, res) ->

app.get '/auth/google/callback', passport.authenticate('google', { failureRedirect: '/login' }), (req, res) ->
  respond.ok res, req.user


# api and resource imports
Api = require('fulton').Api
brands = require './resources/brand_resource'
carts = require './resources/cart_resource'
contacts = require './resources/contact_resource'
customers = require './resources/customer_resource'
deals = require './resources/deal_resource'
diffs = require './resources/diff_resource'
dogs = require './resources/dog_resource'
offers = require './resources/offer_resource'
parcels = require './resources/parcel_resource'
products = require './resources/product_resource'
proposals = require './resources/proposal_resource'
purchase_orders = require './resources/purchase_order_resource'
received_shipments = require './resources/received_shipment_resource'
sales_orders = require './resources/sales_order_resource'
sku_costs = require './resources/sku_cost_resource'
sku_quantities = require './resources/sku_quantity_resource'
skus = require './resources/sku_resource'
subscriptions = require './resources/subscription_resource'
vendors = require './resources/vendor_resource'
warehouses = require './resources/warehouse_resource'

# initialize api
api = new Api()

# register resources
api.register brands
api.register carts
api.register contacts
api.register customers
api.register deals
api.register diffs
api.register dogs
api.register offers
api.register parcels
api.register products
api.register proposals
api.register purchase_orders
api.register received_shipments
api.register sales_orders
api.register sku_costs
api.register sku_quantities
api.register skus
api.register subscriptions
api.register vendors
api.register warehouses

# publish api routes
api.make_routes app


# main loop
http = require 'http'
http.createServer(app).listen app.get('port'), ->
  console.log "express server listening on port #{app.get('port')}"
