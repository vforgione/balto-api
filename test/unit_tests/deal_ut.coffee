describe 'Deal', ->

  deal = {}

  before ->
    Deal = require '../../schemas/deal'
    deal = new Deal
    deal.tags.push { internal: '', public: '' }

  it 'has an _id property', (done) ->
    deal.should.have.property '_id'
    done()

  it 'has a buyer property', (done) ->
    deal.should.have.property 'buyer'
    done()

  it 'has a proposal reference', (done) ->
    deal.should.have.property 'proposal'
    done()

  it 'has an offers array', (done) ->
    deal.should.have.property 'offers'
    done()

  it 'has a text property', (done) ->
    deal.should.have.property 'text'
    done()

  it 'has a state property', (done) ->
    deal.should.have.property 'state'
    done()

  it 'has a starts_on property', (done) ->
    deal.should.have.property 'starts_on'
    done()

  it 'has an ends_on property', (done) ->
    deal.should.have.property 'ends_on'
    done()

  it 'has an after_ends_do property', (done) ->
    deal.should.have.property 'after_ends_do'
    done()

  it 'has an is_subscribable property', (done) ->
    deal.should.have.property 'is_subscribable'
    done()

  it 'has a customer_chooses property', (done) ->
    deal.should.have.property 'customer_chooses'
    done()

  it 'has a tags array', (done) ->
    deal.should.have.property 'tags'
    done()

  it 'has a title property', (done) ->
    deal.should.have.property 'title'
    done()

  it 'has an images array', (done) ->
    deal.should.have.property 'images'
    done()

  it 'has a computed price virtual property', (done) ->
    deal.should.have.property 'price'
    done()

  it 'has a history array', (done) ->
    deal.should.have.property 'history'
    done()

  describe 'Deal.tags', ->

    it 'has an internal property', (done) ->
      deal.tags[0].should.have.property 'internal'
      done()

    it 'has a public property', (done) ->
      deal.tags[0].should.have.property 'public'
      done()
