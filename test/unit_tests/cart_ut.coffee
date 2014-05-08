describe 'Cart', ->

  cart = {}

  before ->
    Cart = require '../../schemas/cart'
    cart = new Cart

  it 'has a customer reference', (done) ->
    cart.should.have.property 'customer'
    done()

  it 'has a checked_out property', (done) ->
    cart.should.have.property 'checked_out'
    done()

  it 'has an offers array', (done) ->
    cart.should.have.property 'offers'
    done()

  it 'has a computed subtotal virtual property', (done) ->
    cart.should.have.property 'subtotal'
    done()

  it 'has a history array', (done) ->
    cart.should.have.property 'history'
    done()
