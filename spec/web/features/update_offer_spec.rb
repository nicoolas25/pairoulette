require 'spec_helper'

feature 'Update an offer' do
  let(:repository) { Domain::Repositories::OfferRepository }
  let(:offer) { Factory.offer(lang: 'en') }

  background do
    # Given the repository has one offer
    repository.clear
    repository.persist(offer)
  end

  scenario 'A creator update an offer' do
    # When the visitor is on the offer submission page
    visit "/backend/#{offer.uid}"

    # Then the new_offer page should show a form
    expect(page).to have_selector('form#offer-update')

    # Given we fill correctly and submit the form
    within('form#offer-update') do
      fill_in 'Duration', with: (offer.duration + 5)
      select 'French', from: 'Language'
      fill_in 'Summary', with: (offer.summary + ' updated')
      fill_in 'Comments', with: (offer.comments + ' updated')
      click_button 'Update'
    end

    # Then the user should have been redirected to the monitoring
    expect(current_path).to match(%r{/backend/[\-0-9a-f]{36}})

    # Then the offer should've been updated
    updated_offer = repository.find_by_uid(offer.uid)
    expect(page).to have_content(updated_offer.summary)
    expect(page).to have_content(updated_offer.comments)
  end
end
