require 'spec_helper'
require 'timecop'
require 'chronic'

feature 'An offer is expired' do
  let(:repository) { Domain::Repositories::OfferRepository }
  let(:offer) { Factory.offer(lang: 'en') }

  background do
    # Given the repository has one offer created 8 days ago
    Timecop.freeze(Chronic.parse('8 days ago')) do
      repository.clear
      repository.persist(offer)
    end
  end

  scenario 'An expired offer is not visible on the list' do
    # When we go to the offer's list
    visit '/'

    # Then the no offer should be here
    expect(page).to_not have_selector('.offers section.offer')
  end

  scenario 'An expired offer is managed and seen as expired' do
    # When the visitor is on the offer submission page
    visit "/backend/#{offer.uid}"

    # Then the new_offer page should show an 'Expired' status
    expect(page).to have_content('Expired')
  end
end
