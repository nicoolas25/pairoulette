require 'domain'

module Backend::Controllers::Requests
  class Destroy
    include Backend::Action

    def call(params)
      offer = offer_repository.find_by_uid(params[:uid])
      request = request_repository.find_by_id(params[:id])

      halt 422 unless offer && request && offer.id == request.offer_id

      request_repository.delete(request)
      redirect_to Backend::Routes.path(:monitor, uid: params[:uid])
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
