require 'spec_helper'
require 'timecop'
require 'pairoulette/repositories/offer_repository'

describe Pairoulette::Repositories::OfferRepository do
  let(:repository) { Pairoulette::Repositories::OfferRepository }

  describe '.visible' do
    subject { repository.visible }

    before do
      repository.clear
      3.times { repository.persist(Factory.offer) }
      2.times { repository.persist(Factory.expired_offer) }
    end

    it 'returns the list of non-expired offers' do
      expect(subject.all.size).to eq(3)
    end
  end

  describe '.persist' do
    let(:offer) { Factory.offer }

    subject { repository.persist(offer) }

    it 'should set the updated_at field of the entity' do
      Timecop.freeze do
        expect{ subject }.to change{ offer.updated_at }.from(nil).to(Time.now)
      end
    end
  end
end
