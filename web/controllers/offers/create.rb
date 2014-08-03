require 'pairoulette'

module Pairoulette::Controllers::Offers
  class Create
    include Pairoulette::Action

    expose :offer

    def call(params)
      @offer = build_offer_from(params)
    end

    private

    def build_offer_from(params)
      Pairoulette::Offer.new({
        email: params[:email],
        duration: params[:duration],
        lang: params[:lang],
        summary: params[:summary],
        comments: params[:comments],
      })
    end
  end
end
