require 'spec_helper'
require 'timecop'

require 'domain/repositories/offer_repository'

describe '#uid' do
  let(:offer) { Factory.offer }

  it 'have an uuid format' do
    uuid_format = /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/i
    expect(offer.uid).to match(uuid_format)
  end
end

describe '#expires_at' do
  let(:offer) { Factory.offer(expires_at: nil) }

  it 'is set Offer::EXPIRATION_DELAY after today' do
    Timecop.freeze do
      expiration_time = Time.now + Domain::Offer::EXPIRATION_DELAY
      expect(offer.expires_at).to eq(expiration_time)
    end
  end
end

describe '#approved' do
  let(:offer) { Factory.offer(approved: nil) }

  it 'is false by default' do
    expect(offer.approved).to eq(false)
  end
end
