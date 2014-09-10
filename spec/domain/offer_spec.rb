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
  let(:offer) { Factory.offer }

  it 'is set Offer::EXPIRATION_DELAY after today' do
    Timecop.freeze do
      expiration_time = Time.now + Domain::Offer::EXPIRATION_DELAY
      expect(offer.expires_at).to eq(expiration_time)
    end
  end
end

describe '#expired?' do
  subject { offer.expired? }

  let(:offer) { Factory.offer }

  it 'is false' do
    expect(subject).to eq(false)
  end

  context 'when the expired_at is more than Offer::EXPIRATION_DELAY days ago' do
    let(:offer) { Factory.expired_offer }

    it 'is true' do
      expect(subject).to eq(true)
    end
  end
end

describe '#reset_expiration' do
  subject { offer.reset_expiration }

  let(:offer) { Factory.expired_offer }

  it 'changes the expires_at attribute' do
    Timecop.freeze do
      expect{ subject }.to change{ offer.expires_at }
    end
  end
end

describe '#approved' do
  let(:offer) { Factory.offer(approved: nil) }

  it 'is false by default' do
    expect(offer.approved).to eq(false)
  end
end
