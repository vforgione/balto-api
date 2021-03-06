describe 'SkuCost', ->

  sku_cost = {}

  before ->
    SkuCost = require '../../schemas/sku_cost'
    Sku = require '../../schemas/sku'
    sku_cost = new SkuCost
    sku_cost.sku = new Sku
    sku_cost.costs.push { cost: 12.34, qty: 10 }

  it 'has a sku reference', (done) ->
    sku_cost.should.have.property 'sku'
    done()

  it 'has a costs array', (done) ->
    sku_cost.should.have.property 'costs'
    done()

  it 'has a position property', (done) ->
    sku_cost.should.have.property 'position'
    done()

  describe 'SkuCost.costs', ->

    it 'has a cost property', (done) ->
      sku_cost.costs[0].should.have.property 'cost'
      done()

    it 'has a quantity property', (done) ->
      sku_cost.costs[0].should.have.property 'quantity'
      done()

    it 'has a date property', (done) ->
      sku_cost.costs[0].should.have.property 'date'
      done()

  it 'has a history array', (done) ->
    sku_cost.should.have.property 'history'
    done()
