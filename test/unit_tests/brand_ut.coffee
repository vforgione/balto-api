describe 'Brand', ->

  brand = {}

  before ->
    Brand = require '../../schemas/brand'
    brand = new Brand
    brand.tags.push { internal: '', public: '' }

  it 'has an _id property', (done) ->
    brand.should.have.property '_id'
    done()

  it 'has a name property', (done) ->
    brand.should.have.property 'name'
    done()

  it 'has a tags array', (done) ->
    brand.should.have.property 'tags'
    done()

  it 'has a history array', (done) ->
    brand.should.have.property 'history'
    done()

  describe 'Brand.tags', ->

    it 'has an internal property', (done) ->
      brand.tags[0].should.have.property 'internal'
      done()

    it 'has a public property', (done) ->
      brand.tags[0].should.have.property 'public'
      done()
