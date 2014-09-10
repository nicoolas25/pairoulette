module Backend::Views::Offers
  class Monitor
    include Backend::View

    def offer
      @offer ||= Backend::OfferPresenter.new(locals[:offer])
    end

    def requests
      @requests ||= locals[:requests].map{ |req| Backend::RequestPresenter.new(req) }
    end
  end
end
