require 'spec_helper'

feature 'Monitor an offer' do
  let(:repository) { Domain::Repositories::OfferRepository }
  let(:offer) { Factory.offer }

  background do
    # Given an offer is in the repository
    repository.clear
    repository.persist(offer)
  end

  scenario 'A visitor access the monitoring interface of an offer' do
    # When the visitor is on the manage page
    visit "/backend/#{offer.uid}"

    # Then the page should show him the expiration date
    date = offer.expires_at.strftime('%Y-%m-%d')
    expect(page).to have_content(date)
  end
end
