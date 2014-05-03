describe 'Sku', ->

  sku = {}

  before ->
    Sku = require '../../schemas/sku'
    sku = new Sku

  it 'has an _id property', (done) ->
    sku.should.have.property '_id'
    done()

  it 'has a number property', (done) ->
    sku.should.have.property 'number'
    done()

  it 'has a name property', (done) ->
    sku.should.have.property 'name'
    done()

  it 'has a uom object', (done) ->
    sku.should.have.property 'uom'
    done()

  describe 'Sku.uom', ->

    it 'has a count property', (done) ->
      sku.uom.should.have.property 'count'
      done()

    it 'has a unit_type property', (done) ->
      sku.uom.should.have.property 'unit_type'
      done()
