describe 'Product', ->

  prod = {}

  before ->
    Product = require '../../schemas/product'
    Sku = require '../../schemas/sku'
    prod = new Product
    prod.sku = new Sku

  it 'has an _id property', (done) ->
    prod.should.have.property '_id'
    done()

  it 'has a sku reference', (done) ->
    prod.should.have.property 'sku'
    done()

  it 'has a skus_per property', (done) ->
    prod.should.have.property 'skus_per'
    done()

  it 'has a uom object', (done) ->
    prod.should.have.property 'uom'
    done()

  it 'has a name virtual property', (done) ->
    prod.should.have.property 'name'
    done()

  it 'has a computed available_for_sale virtual property', (done) ->
    prod.should.have.property 'available_for_sale'
    done()

  describe 'Product.uom', ->

    it 'has a count property', (done) ->
      prod.uom.should.have.property 'count'
      done()

    it 'has a unit_type property', (done) ->
      prod.uom.should.have.property 'unit_type'
      done()
