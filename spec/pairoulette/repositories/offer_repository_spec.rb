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

  describe '.find_by_uid' do
    let(:uid) { '01234567-89ab-cdef-0123-456789abcdef' }

    subject { repository.find_by_uid(uid) }

    before do
      repository.clear
    end

    context 'when there is no offer matching the given uid' do
      it 'returns nil' do
        expect(subject).to be_nil
      end
    end

    context 'when an offer with the given uid exists' do
      before do
        repository.persist(Factory.offer(uid: uid))
      end

      it 'retrieves an offer by its uid' do
        expect(subject).to be_a_kind_of(Pairoulette::Offer)
      end
    end
  end
end
