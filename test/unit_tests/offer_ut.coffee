describe 'Offer', ->

  offer = {}

  before ->
    Offer = require '../../schemas/offer'
    offer = new Offer
    Product = require '../../schemas/product'
    Sku = require '../../schemas/sku'
    prod = new Product
    prod.sku = new Sku
    offer.products.push { product: prod, qty: 1 }

  it 'has an _id property', (done) ->
    offer.should.have.property '_id'
    done()

  it 'has a products array', (done) ->
    offer.should.have.property 'products'
    done()

  describe 'Offer.products', ->

    it 'has a product reference', (done) ->
      offer.products[0].should.have.property 'product'
      done()

    it 'has a qty property', (done) ->
      offer.products[0].should.have.property 'qty'
      done()

  it 'has a weight property', (done) ->
    offer.should.have.property 'weight'
    done()

  it 'has a price property', (done) ->
    offer.should.have.property 'price'
    done()

  it 'has a name virtual property', (done) ->
    offer.should.have.property 'name'
    done()

  it 'has a computed available_for_sale virtual property', (done) ->
    offer.should.have.property 'available_for_sale'
    done()
