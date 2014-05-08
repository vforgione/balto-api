describe 'Customer', ->

  customer = {}

  before ->
    Customer = require '../../schemas/customer'
    customer = new Customer
    customer.addresses.push {}

  it 'has a name property', (done) ->
    customer.should.have.property 'name'
    done()

  it 'has an email property', (done) ->
    customer.should.have.property 'email'
    done()

  it 'has an addresses object', (done) ->
    customer.should.have.property 'addresses'
    done()

  it 'has a history array', (done) ->
    customer.should.have.property 'history'
    done()

  describe 'Customer.address', ->

    it 'has a name property', (done) ->
      customer.addresses[0].should.have.property 'name'
      done()

    it 'has a street1 property', (done) ->
      customer.addresses[0].should.have.property 'street1'
      done()

    it 'has a street2 property', (done) ->
      customer.addresses[0].should.have.property 'street2'
      done()

    it 'has a street3 property', (done) ->
      customer.addresses[0].should.have.property 'street3'
      done()

    it 'has a city property', (done) ->
      customer.addresses[0].should.have.property 'city'
      done()

    it 'has a state property', (done) ->
      customer.addresses[0].should.have.property 'state'
      done()

    it 'has a postal_code property', (done) ->
      customer.addresses[0].should.have.property 'postal_code'
      done()

    it 'has a country property', (done) ->
      customer.addresses[0].should.have.property 'country'
      done()
