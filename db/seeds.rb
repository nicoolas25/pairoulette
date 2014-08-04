require 'domain'
Domain.load!

require_relative '../spec/support/factory'

puts 'Create random offers...'

repository = Domain::Repositories::OfferRepository
5.times do
  offer = Factory.offer
  repository.persist(offer)
end
