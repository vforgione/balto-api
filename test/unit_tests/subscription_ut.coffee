describe 'Subscription', ->

  sub = {}

  before ->
    Subscription = require '../../schemas/subscription'
    sub = new Subscription

  it 'has an _id property', (done) ->
    sub.should.have.property '_id'
    done()

  it 'has a customer reference', (done) ->
    sub.should.have.property 'customer'
    done()

  it 'has an offer reference', (done) ->
    sub.should.have.property 'offer'
    done()

  it 'has an active property', (done) ->
    sub.should.have.property 'active'
    done()

  it 'has a starts_on property', (done) ->
    sub.should.have.property 'starts_on'
    done()

  it 'has an ends_on property', (done) ->
    sub.should.have.property 'ends_on'
    done()

  it 'has a cadence property', (done) ->
    sub.should.have.property 'cadence'
    done()

  it 'has an interval property', (done) ->
    sub.should.have.property 'interval'
    done()

  it 'has a history array', (done) ->
    sub.should.have.property 'history'
    done()
