require 'domain'

module Backend::Controllers::Offers
  class Monitor
    include Backend::Action

    expose :offer
    expose :requests

    def call(params)
      @offer = offer_repository.find_by_uid(params[:uid])
      @requests = request_repository.find_all_by_offer_id(@offer.id)
    end

    private

    def offer_repository
      Domain::Repositories::OfferRepository
    end

    def request_repository
      Domain::Repositories::RequestRepository
    end
  end
end
