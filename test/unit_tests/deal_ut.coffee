describe 'Deal', ->

  deal = {}

  before ->
    Deal = require '../../schemas/deal'
    deal = new Deal

  it 'has an _id property', (done) ->
    deal.should.have.property '_id'
    done()

  it 'has an offers array', (done) ->
    deal.should.have.property 'offers'
    done()

  it 'has a text property', (done) ->
    deal.should.have.property 'text'
    done()
