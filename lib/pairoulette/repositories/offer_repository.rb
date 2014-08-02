require 'lotus/repository'

module Pairoulette::Repositories
  class OfferRepository
    include Lotus::Repository

    def self.visible
      query do
        where{ expires_at >= Time.now }
      end
    end
  end
end
