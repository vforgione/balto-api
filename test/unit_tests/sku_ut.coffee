describe 'Sku', ->

  sku = {}

  before ->
    Sku = require '../../schemas/sku'
    Vendor = require '../../schemas/vendor'
    sku = new Sku
    sku.vendors.push { vendor: new Vendor, number: "123" }
    sku.tags.push { internal: 'stuff', public: '' }

  it 'has a number property', (done) ->
    sku.should.have.property 'number'
    done()

  it 'has a name property', (done) ->
    sku.should.have.property 'name'
    done()

  it 'has a brand reference', (done) ->
    sku.should.have.property 'brand'
    done()

  it 'has a vendors object', (done) ->
    sku.should.have.property 'vendors'
    done()

  it 'has an images array', (done) ->
    sku.should.have.property 'images'
    done()

  it 'has a tags array', (done) ->
    sku.should.have.property 'tags'
    done()

  it 'has a history array', (done) ->
    sku.should.have.property 'history'
    done()

  describe 'Sku.vendors', ->

    it 'has a vendor reference', (done) ->
      sku.vendors[0].should.have.property 'vendor'
      done()

    it 'has a vendor_sku_number property', (done) ->
      sku.vendors[0].should.have.property 'vendor_sku_number'
      done()

  describe 'Sku.tags', ->

    it 'has an internal property', (done) ->
      sku.tags[0].should.have.property 'internal'
      done()

    it 'has a public property', (done) ->
      sku.tags[0].should.have.property 'public'
      done()
