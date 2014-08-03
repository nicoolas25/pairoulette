require 'pairoulette'

module Frontend::Controllers::Offers
  class Create
    include Frontend::Action

    expose :offer

    def call(params)
      @offer = build_offer_from(params)
      repository.persist(@offer)
    end

    private

    def repository
      Pairoulette::Repositories::OfferRepository
    end

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
