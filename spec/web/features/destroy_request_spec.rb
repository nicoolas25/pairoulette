require 'pry'
require 'spec_helper'

feature 'Destroy a request' do
  let(:request_repository) { Domain::Repositories::RequestRepository }
  let(:offer_repository) { Domain::Repositories::OfferRepository }

  let(:offer) { offer = Factory.offer ; offer_repository.persist(offer) ; offer }
  let(:request) { request = Factory.request(offer_id: offer.id) ; request_repository.persist(request) ; request }

  background do
    # Given the request repository is empty
    request_repository.clear
    offer_repository.clear

    # Given an existing request
    request
  end

  scenario 'An offer manager can clean the list of its requests' do
    # Given the visitor is on the homepage
    visit "/backend/#{offer.uid}"

    # Then the page should show a request form
    expect(page).to have_selector('#requests .request')

    # Given we click the remove button
    within('#requests .request') { click_button 'Remove' }

    # Then the new request should have been stored in the repository
    expect(request_repository.first).to be_nil
  end
end
