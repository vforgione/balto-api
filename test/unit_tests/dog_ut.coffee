describe 'Dog', ->

  dog = {}

  before ->
    Dog = require '../../schemas/dog'
    dog = new Dog

  it 'has an _id property', (done) ->
    dog.should.have.property '_id'
    done()

  it 'has a name property', (done) ->
    dog.should.have.property 'name'
    done()

  it 'has an owner property that references Customer', (done) ->
    dog.should.have.property 'owner'
    done()

  it 'has a breed property', (done) ->
    dog.should.have.property 'breed'
    done()

  it 'has a birthday property', (done) ->
    dog.should.have.property 'birthday'
    done()

  it 'has a weight property', (done) ->
    dog.should.have.property 'weight'
    done()

  it 'has a gender property', (done) ->
    dog.should.have.property 'gender'
    done()

  it 'has a favorites array that references Product', (done) ->
    dog.should.have.property 'favorites'
    done()

  it 'has a history array', (done) ->
    dog.should.have.property 'history'
    done()
