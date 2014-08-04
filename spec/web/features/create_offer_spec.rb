require 'spec_helper'

feature 'Create an offer' do
  let(:repository) { Domain::Repositories::OfferRepository }

  background do
    # Given the repository is empty
    repository.clear
  end

  scenario 'A visitor publish a new offer' do
    # When the visitor is on the offer submission page
    visit '/submit'

    # Then the new_offer page should show a form
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

    # Then the user should have been redirected to the monitoring
    expect(current_path).to match(%r{/backend/[\-0-9a-f]{36}})

    # Then the new offer should have been stored in the repository
    expect(repository.first).to_not be_nil


    # Given we go back to the offer's list
    visit '/'

    # Then the offer should be here
    expect(page).to have_selector('.offers section.offer')
  end
end
