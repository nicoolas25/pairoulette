require 'domain'

module Backend::Controllers::Offers
  class Update
    include Backend::Action

    def call(params)
      offer = repository.find_by_uid(params[:uid])
      form  = Backend::OfferForm.new(offer)
      offer = form.fill_with!(params, self)
      repository.persist(offer)
      redirect_to Backend::Routes.path(:monitor, uid: params[:uid])
    end

    def form_invalid
      halt 422
    end

    private

    def repository
      Domain::Repositories::OfferRepository
    end
  end
end
