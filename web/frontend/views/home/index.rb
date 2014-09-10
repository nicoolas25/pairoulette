module Frontend::Views::Home
  class Index
    include Frontend::View

    def offers
      @offers ||= locals[:offers].map{ |offer| Frontend::OfferPresenter.new(offer) }
    end
  end
end
