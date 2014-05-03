express = require 'express'
http = require 'http'
mongoose = require 'mongoose'

SkuResource = require './resources/sku_resource'
SkuQuantityResource = require './resources/sku_quantity_resource'
ProductResource = require './resources/product_resource'
OfferResource = require './resources/offer_resource'
DealResource = require './resources/deal_resource'


app = express()


mongoose.connect process.env.MONGODB_CONNECTION_STRING or 'mongodb://localhost:27017/balto-dev'


app.set 'port', process.env.PORT or 3000


app.use express.logger()
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use app.router
app.use express.errorHandler()


# routes
SkuResource.make_routes app
SkuQuantityResource.make_routes app
ProductResource.make_routes app
OfferResource.make_routes app
DealResource.make_routes app


http.createServer(app).listen app.get('port'), ->
  console.log "express server listening on port #{app.get('port')}"
