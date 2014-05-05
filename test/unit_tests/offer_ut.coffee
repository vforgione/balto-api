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
    offer.tags.push { internal: '', public: '' }

  it 'has an _id property', (done) ->
    offer.should.have.property '_id'
    done()

  it 'has a products array', (done) ->
    offer.should.have.property 'products'
    done()

  it 'has a weight property', (done) ->
    offer.should.have.property 'weight'
    done()

  it 'has a price property', (done) ->
    offer.should.have.property 'price'
    done()

  it 'has a tags array', (done) ->
    offer.should.have.property 'tags'
    done()

  it 'has an images array', (done) ->
    offer.should.have.property 'images'
    done()

  it 'has a text property', (done) ->
    offer.should.have.property 'text'
    done()

  it 'has a name virtual property', (done) ->
    offer.should.have.property 'name'
    done()

  it 'has a computed available_for_sale virtual property', (done) ->
    offer.should.have.property 'available_for_sale'
    done()

  describe 'Offer.products', ->

    it 'has a product reference', (done) ->
      offer.products[0].should.have.property 'product'
      done()

    it 'has a qty property', (done) ->
      offer.products[0].should.have.property 'qty'
      done()

  describe 'Offer.tags', ->

    it 'has an internal property', (done) ->
      offer.tags[0].should.have.property 'internal'
      done()

    it 'has a public property', (done) ->
      offer.tags[0].should.have.property 'public'
      done()
