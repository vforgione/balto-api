describe 'Parcel', ->

  parcel = {}

  before ->
    Parcel = require '../../schemas/parcel'
    parcel = new Parcel

  it 'has a products array', (done) ->
    parcel.should.have.property 'products'
    done()

  it 'has a carrier property', (done) ->
    parcel.should.have.property 'carrier'
    done()

  it 'has a tracking_url property', (done) ->
    parcel.should.have.property 'tracking_url'
    done()

  it 'has a destination property', (done) ->
    parcel.should.have.property 'destination'
    done()

  it 'has an origin reference to a warehouse', (done) ->
    parcel.should.have.property 'origin'
    done()

  it 'has a history array', (done) ->
    parcel.should.have.property 'history'
    done()
