require 'domain'

module Frontend::Controllers::Home
  class Index
    include Frontend::Action

    expose :offers

    def call(params)
      @offers = Domain::Repositories::OfferRepository.visible
    end
  end
end
