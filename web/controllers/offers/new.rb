require 'pairoulette'

module Pairoulette::Controllers::Offers
  class New
    include Pairoulette::Action

    expose :offer

    def call(params)
      @offer = Pairoulette::Offer.new
    end
  end
end
