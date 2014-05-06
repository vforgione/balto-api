describe 'Contact', ->

  contact = {}

  before ->
    Contact = require '../../schemas/contact'
    contact = new Contact

  it 'has an _id property', (done) ->
    contact.should.have.property '_id'
    done()

  it 'has a name property', (done) ->
    contact.should.have.property 'name'
    done()

  it 'has an email property', (done) ->
    contact.should.have.property 'email'
    done()

  it 'has a phone property', (done) ->
    contact.should.have.property 'phone'
    done()

  it 'has an alt_phone property', (done) ->
    contact.should.have.property 'alt_phone'
    done()

  it 'has a fax property', (done) ->
    contact.should.have.property 'fax'
    done()

  it 'has an address object', (done) ->
    contact.should.have.property 'address'
    done()

  it 'has a represents reference to a vendor', (done) ->
    contact.should.have.property 'represents'
    done()

  it 'has a history array', (done) ->
    contact.should.have.property 'history'
    done()

  describe 'Contact.address', ->

    it 'has an street1 property', (done) ->
      contact.address.should.have.property 'street1'
      done()

    it 'has an street2 property', (done) ->
      contact.address.should.have.property 'street2'
      done()

    it 'has an street3 property', (done) ->
      contact.address.should.have.property 'street3'
      done()

    it 'has a city property', (done) ->
      contact.address.should.have.property 'city'
      done()

    it 'has a state property', (done) ->
      contact.address.should.have.property 'state'
      done()

    it 'has a postal_code property', (done) ->
      contact.address.should.have.property 'postal_code'
      done()

    it 'has a country property', (done) ->
      contact.address.should.have.property 'country'
      done()
