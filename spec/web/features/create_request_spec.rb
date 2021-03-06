require 'pry'
require 'spec_helper'

feature 'Create a request' do
  let(:request_repository) { Domain::Repositories::RequestRepository }
  let(:offer_repository) { Domain::Repositories::OfferRepository }
  let(:offer) { offer = Factory.offer ; offer_repository.persist(offer) ; offer }

  background do
    # Given the request repository is empty
    request_repository.clear
    offer_repository.clear

    # Given an existing offer
    offer
  end

  scenario 'A visitor should have a form to send a request for offer' do
    # Given the visitor is on the homepage
    visit '/'

    # Then the page should show a request form
    expect(page).to have_selector('.offers .offer form.request-create')

    # Given we fill correctly and submit the form
    within('form.request-create') do
      fill_in 'Contact', with: 'example@example.org'
      fill_in 'Comments', with: Faker::Lorem.paragraph(4)
      click_button "I'm interested!"
    end

    # Then the new request should have been stored in the repository
    expect(request_repository.first).to_not be_nil
  end
end
