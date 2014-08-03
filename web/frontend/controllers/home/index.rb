require 'pairoulette'

module Frontend::Controllers::Home
  class Index
    include Frontend::Action

    expose :offers

    def call(params)
      @offers = Pairoulette::Repositories::OfferRepository.visible
    end
  end
end
