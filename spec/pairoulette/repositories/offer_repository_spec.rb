require 'spec_helper'
require 'pairoulette/repositories/offer_repository'

describe Pairoulette::Repositories::OfferRepository do
  describe 'visible' do
    let(:repository) { Pairoulette::Repositories::OfferRepository }

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
end
