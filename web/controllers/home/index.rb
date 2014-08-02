require 'pairoulette'

module Pairoulette::Controllers::Home
  class Index
    include Pairoulette::Action

    expose :offers

    def call(params)
      @offers = Pairoulette::Repositories::OfferRepository.visible
    end
  end
end
