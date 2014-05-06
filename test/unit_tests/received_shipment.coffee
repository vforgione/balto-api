describe 'ReceivedShipment', ->

  ship = {}

  before ->
    ReceivedShipment = require '../../schemas/received_shipment'
    Sku = require '../../schemas/sku'
    ship = new ReceivedShipment
    ship.line_items.push { sku: new Sku, qty: 1 }

  it 'has an _id property', (done) ->
    ship.should.have.property '_id'
    done()

  it 'has a received_by property', (done) ->
    ship.should.have.property 'received_by'
    done()

  it 'has a purchase_order reference', (done) ->
    ship.should.have.property 'purchase_order'
    done()

  it 'has a date property', (done) ->
    ship.should.have.property 'date'
    done()

  it 'has a line_items array', (done) ->
    ship.should.have.property 'line_items'
    done()

  it 'has a note property', (done) ->
    ship.should.have.property 'note'
    done()

  it 'has a history array', (done) ->
    ship.should.have.property 'history'
    done()

  describe 'ReceivedShipment.line_items', ->

    it 'has a sku reference', (done) ->
      ship.line_items[0].should.have.property 'sku'
      done()

    it 'has a qty property', (done) ->
      ship.line_items[0].should.have.property 'qty'
      done()
