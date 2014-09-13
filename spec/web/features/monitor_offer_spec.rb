require 'spec_helper'

feature 'Monitor an offer' do
  let(:offer_repository) { Domain::Repositories::OfferRepository }
  let(:request_repository) { Domain::Repositories::RequestRepository }

  let(:offer) { Factory.offer }

  background do
    # Given an offer is in the repository
    offer_repository.clear
    offer_repository.persist(offer)
  end

  scenario 'A visitor access the monitoring interface of an offer' do
    # When the visitor is on the manage page
    visit "/backend/#{offer.uid}"

    # Then the page should show him the expiration date
    date = offer.expires_at.strftime('%Y-%m-%d')
    expect(page).to have_content(date)
  end

  scenario 'The monitoring interface lists the requests' do
    # Given there is an existing request for the offer
    request = Factory.request(offer_id: offer.id)
    request_repository.persist(request)

    # When the visitor is on the manage page
    visit "/backend/#{offer.uid}"

    # Then the page should show him a list of requests
    expect(page).to have_css('#requests .request')
    expect(page).to have_content(request.contact)
    expect(page).to have_content(request.comments)
  end
end
