describe 'SkuQuantity', ->

  sku = {}

  before ->
    SkuQuantity = require '../../schemas/sku_quantity'
    sku = new SkuQuantity

  it 'has a sku reference', (done) ->
    sku.should.have.property 'sku'
    done()

  it 'has an on_shelf property', (done) ->
      sku.should.have.property 'on_shelf'
      done()

  it 'has an in_carts property', (done) ->
    sku.should.have.property 'in_carts'
    done()

  it 'has a to_be_picked property', (done) ->
    sku.should.have.property 'to_be_picked'
    done()

  it 'has a computed available_for_sale virtual property', (done) ->
    sku.should.have.property 'available_for_sale'
    done()

  it 'has a history array', (done) ->
    sku.should.have.property 'history'
    done()
