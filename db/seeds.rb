require 'pairoulette'
Pairoulette.load!

require_relative '../spec/support/factory'

puts 'Create random offers...'

repository = Pairoulette::Repositories::OfferRepository
5.times do
  offer = Factory.offer
  repository.persist(offer)
end
