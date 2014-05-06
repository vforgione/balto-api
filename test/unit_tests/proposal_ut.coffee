describe 'Proposal', ->

  prop = {}

  before ->
    Proposal = require '../../schemas/proposal'
    prop = new Proposal

  it 'has an _id property', (done) ->
    prop.should.have.property '_id'
    done()

  it 'has a buyer property', (done) ->
    prop.should.have.property 'buyer'
    done()

  it 'has a state property', (done) ->
    prop.should.have.property 'state'
    done()

  it 'has a title property', (done) ->
    prop.should.have.property 'title'
    done()

  it 'has a products array', (done) ->
    prop.should.have.property 'products'
    done()

  it 'has a revenue property', (done) ->
    prop.should.have.property 'revenue'
    done()

  it 'has a cogs property', (done) ->
    prop.should.have.property 'cogs'
    done()

  it 'has a price property', (done) ->
    prop.should.have.property 'price'
    done()

  it 'has an msrp property', (done) ->
    prop.should.have.property 'msrp'
    done()

  it 'has a vendor reference', (done) ->
    prop.should.have.property 'vendor'
    done()

  it 'has a tags array', (done) ->
    prop.should.have.property 'tags'
    done()
