module Backend::Views::Offers
  class Monitor
    include Backend::View

    def offer
      @offer ||= Backend::OfferPresenter.new(locals[:offer])
    end
  end
end
