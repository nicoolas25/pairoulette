require 'domain'

module Backend::Controllers::Offers
  class Monitor
    include Backend::Action

    expose :offer

    def call(params)
      @offer = repository.find_by_uid(params[:uid])
    end

    private

    def repository
      Domain::Repositories::OfferRepository
    end
  end
end
