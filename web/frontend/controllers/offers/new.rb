require 'pairoulette'

module Frontend::Controllers::Offers
  class New
    include Frontend::Action

    expose :offer

    def call(params)
      @offer = Pairoulette::Offer.new
    end
  end
end
