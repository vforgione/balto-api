describe 'PurchaseOrder', ->

  po = {}

  before ->
    PurchaseOrder = require '../../schemas/purchase_order'
    Sku = require '../../schemas/sku'
    po = new PurchaseOrder
    po.line_items.push { sku: new Sku, qty: 1, unit_price: 1 }

  it 'has a creator property', (done) ->
    po.should.have.property 'creator'
    done()

  it 'has a contact reference', (done) ->
    po.should.have.property 'contact'
    done()

  it 'has a destination reference to a warehouse', (done) ->
    po.should.have.property 'destination'
    done()

  it 'has a date property', (done) ->
    po.should.have.property 'date'
    done()

  it 'has a terms property', (done) ->
    po.should.have.property 'terms'
    done()

  it 'has a note property', (done) ->
    po.should.have.property 'note'
    done()

  it 'has a tax property', (done) ->
    po.should.have.property 'tax'
    done()

  it 'has a shipping property', (done) ->
    po.should.have.property 'shipping'
    done()

  it 'has a discount property', (done) ->
    po.should.have.property 'discount'
    done()

  it 'has a tracking_url property', (done) ->
    po.should.have.property 'tracking_url'
    done()

  it 'has a computed total virtual property', (done) ->
    po.should.have.property 'total'
    done()

  it 'has a line_items array', (done) ->
    po.should.have.property 'line_items'
    done()

  it 'has a history array', (done) ->
    po.should.have.property 'history'
    done()

  describe 'PurchaseOrder.line_items', ->

    it 'has a sku reference', (done) ->
      po.line_items[0].should.have.property 'sku'
      done()

    it 'has a quantity property', (done) ->
      po.line_items[0].should.have.property 'quantity'
      done()

    it 'has a unit_price property', (done) ->
      po.line_items[0].should.have.property 'unit_price'
      done()

    it 'has a discount property', (done) ->
      po.line_items[0].should.have.property 'discount'
      done()
