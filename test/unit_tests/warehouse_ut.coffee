describe 'Warehouse', ->

  house = {}

  before ->
    Warehouse = require '../../schemas/warehouse'
    house = new Warehouse

  it 'has a name property', (done) ->
    house.should.have.property 'name'
    done()

  it 'has an address object', (done) ->
    house.should.have.property 'address'
    done()

  it 'has a history array', (done) ->
    house.should.have.property 'history'
    done()

  describe 'Warehouse.address', ->

    it 'has an street1 property', (done) ->
      house.address.should.have.property 'street1'
      done()

    it 'has an street2 property', (done) ->
      house.address.should.have.property 'street2'
      done()

    it 'has an street3 property', (done) ->
      house.address.should.have.property 'street3'
      done()

    it 'has a city property', (done) ->
      house.address.should.have.property 'city'
      done()

    it 'has a state property', (done) ->
      house.address.should.have.property 'state'
      done()

    it 'has a postal_code property', (done) ->
      house.address.should.have.property 'postal_code'
      done()

    it 'has a country property', (done) ->
      house.address.should.have.property 'country'
      done()
