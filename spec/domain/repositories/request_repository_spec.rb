require 'spec_helper'
require 'timecop'

require 'domain/repositories/offer_repository'
require 'domain/repositories/request_repository'

describe Domain::Repositories::RequestRepository do
  let(:repository) { Domain::Repositories::RequestRepository }

  let(:offer) {
    offer = Factory.offer
    Domain::Repositories::OfferRepository.persist(offer)
    offer
  }

  describe '.find_all_by_offer_id' do
    subject { repository.find_all_by_offer_id(offer.id) }

    before do
      repository.clear
      3.times { repository.persist(Factory.request(offer_id: offer.id)) }
      2.times { repository.persist(Factory.request(offer_id: nil)) }
    end

    it 'returns the 3 requests matching the offer id' do
      expect(subject.size).to eq(3)
    end
  end
end
