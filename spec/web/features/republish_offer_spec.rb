require 'spec_helper'
require 'timecop'
require 'chronic'

feature 'An expired offer is republished' do
  let(:repository) { Domain::Repositories::OfferRepository }
  let(:offer) { Factory.offer(lang: 'en') }

  background do
    # Given the repository has one offer created 8 days ago
    Timecop.freeze(Chronic.parse('8 days ago')) do
      repository.clear
      repository.persist(offer)
    end
  end

  scenario 'An expired offer is updated' do
    # When the visitor is on the offer submission page
    visit "/backend/#{offer.uid}"

    # When the visitor submit the form
    within('form#offer-update') do
      # Do nothing else on the fields
      click_button 'Update'
    end

    # Then the new_offer page should not show an 'Expired' status anymore
    expect(page).to_not have_content('Expired')

    # Given we go to the offer's list
    visit '/'

    # Then the offer should be here
    expect(page).to have_selector('.offers section.offer')
  end
end
