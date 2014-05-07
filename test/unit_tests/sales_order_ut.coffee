describe 'SalesOrder', ->

  so = {}

  before ->
    SalesOrder = require '../../schemas/sales_order'
    so = new SalesOrder

  it 'has an _id property', (done) ->
    so.should.have.property '_id'
    done()

  it 'has a cart reference', (done) ->
    so.should.have.property 'cart'
    done()

  it 'has a state property', (done) ->
    so.should.have.property 'state'
    done()

  it 'has a tax property', (done) ->
    so.should.have.property 'tax'
    done()

  it 'has a computed total virtual property', (done) ->
    so.should.have.property 'total'
    done()

  it 'has a history array', (done) ->
    so.should.have.property 'history'
    done()
