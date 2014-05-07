describe 'Product', ->

  prod = {}

  before ->
    Product = require '../../schemas/product'
    Sku = require '../../schemas/sku'
    prod = new Product
    prod.sku = new Sku

  it 'has a sku reference', (done) ->
    prod.should.have.property 'sku'
    done()

  it 'has a skus_per property', (done) ->
    prod.should.have.property 'skus_per'
    done()

  it 'has a name virtual property', (done) ->
    prod.should.have.property 'name'
    done()

  it 'has a computed available_for_sale virtual property', (done) ->
    prod.should.have.property 'available_for_sale'
    done()

  it 'has a history array', (done) ->
    prod.should.have.property 'history'
    done()
