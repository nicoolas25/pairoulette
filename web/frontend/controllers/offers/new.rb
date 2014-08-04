require 'domain'

module Frontend::Controllers::Offers
  class New
    include Frontend::Action

    expose :offer

    def call(params)
      @offer = Domain::Offer.new
    end
  end
end
