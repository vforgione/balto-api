express = require 'express'
http = require 'http'
mongoose = require 'mongoose'

DiffResource = require './resources/diff_resource'
BrandResource = require './resources/brand_resource'
VendorResource = require './resources/vendor_resource'
SkuResource = require './resources/sku_resource'
SkuCostResource = require './resources/sku_cost_resource'
SkuQuantityResource = require './resources/sku_quantity_resource'
ProductResource = require './resources/product_resource'
OfferResource = require './resources/offer_resource'
DealResource = require './resources/deal_resource'
WarehouseResource = require './resources/warehouse_resource'
ContactResource = require './resources/contact_resource'
PurchaseOrderResource = require './resources/purchase_order_resource'
ReceivedShipmentResource = require './resources/received_shipment_resource'
ProposalResource = require './resources/proposal_resource'
CustomerResource = require './resources/customer_resource'
CartResource = require './resources/cart_resource'
SalesOrderResource = require './resources/sales_order_resource'
ParcelResource = require './resources/parcel_resource'
SubscriptionResource = require './resources/subscription_resource'
DogResource = require './resources/dog_resource'


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
DiffResource.make_routes app
BrandResource.make_routes app
VendorResource.make_routes app
SkuResource.make_routes app
SkuCostResource.make_routes app
SkuQuantityResource.make_routes app
ProductResource.make_routes app
OfferResource.make_routes app
DealResource.make_routes app
WarehouseResource.make_routes app
ContactResource.make_routes app
PurchaseOrderResource.make_routes app
ReceivedShipmentResource.make_routes app
ProposalResource.make_routes app
CustomerResource.make_routes app
CartResource.make_routes app
SalesOrderResource.make_routes app
ParcelResource.make_routes app
SubscriptionResource.make_routes app
DogResource.make_routes app


http.createServer(app).listen app.get('port'), ->
  console.log "express server listening on port #{app.get('port')}"
