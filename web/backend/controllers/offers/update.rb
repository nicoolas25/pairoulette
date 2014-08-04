require 'domain'

module Backend::Controllers::Offers
  class Update
    include Backend::Action

    def call(params)
      offer = repository.find_by_uid(params[:uid])
      update_offer_with(offer, params)
      redirect_to Backend::Routes.path(:monitor, uid: params[:uid])
    end

    private

    def repository
      Domain::Repositories::OfferRepository
    end

    def update_offer_with(offer, params)
      offer.duration = params[:duration] if params[:duration]
      offer.lang     = params[:lang]     if params[:lang]
      offer.summary  = params[:summary]  if params[:summary]
      offer.comments = params[:comments] if params[:comments]
      repository.persist(offer)
    end
  end
end
