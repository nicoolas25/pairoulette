require 'spec_helper'
require 'pairoulette/offer'

describe 'Uid' do
  before do
    @offer = Pairoulette::Offer.new({
      email: 'example@example.org',
      duration: 40,
      lang: 'fr en',
      summary: 'Lorem ipsum',
    })
  end

  it 'have an uuid format' do
    uuid_format = /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/i
    expect(@offer.uid).to match(uuid_format)
  end
end
