require 'spec_helper'

feature 'Visit Home' do
  let(:repository) { Domain::Repositories::OfferRepository }

  let(:offer) { Factory.offer }

  background do
    # Given an existing offer in the repository
    repository.clear
    repository.persist(offer)
  end

  scenario 'The list of offers is shown' do
    # When I visit the homepage
    visit '/'

    # Then the page should have an offer
    expect(page).to have_css('.offers section.offer')
  end
end
