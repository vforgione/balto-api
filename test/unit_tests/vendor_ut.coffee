describe 'Vendor', ->

  vendor = {}

  before ->
    Vendor = require '../../schemas/vendor'
    vendor = new Vendor

  it 'has a name property', (done) ->
    vendor.should.have.property 'name'
    done()

  it 'has a history array', (done) ->
    vendor.should.have.property 'history'
    done()
