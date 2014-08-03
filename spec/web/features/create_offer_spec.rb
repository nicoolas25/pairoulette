require 'spec_helper'
require 'pairoulette/repositories/offer_repository'

feature 'Create offer' do
  let(:repository) { Pairoulette::Repositories::OfferRepository }

  background do
    # Given the repository is empty
    repository.clear
  end

  scenario 'A visitor publish a new offer' do
    visit '/submit'

    # The new_offer page should show a form
    expect(page).to have_selector('form#offer-create')

    # Given we fill correctly and submit the form
    within('form#offer-create') do
      fill_in 'Email', with: 'example@example.org'
      fill_in 'Duration', with: '45'
      select 'French', from: 'Language'
      fill_in 'Summary', with: Faker::Lorem.paragraph(4)
      fill_in 'Comments', with: Faker::Lorem.paragraph(4)
      click_button 'Publish'
    end

    # Then the resulting page should show the newly created offer
    expect(page).to have_selector('.offers section.offer')

    # Then the new offer should have been stored in the repository
    expect(repository.first).to_not be_nil
  end
end
