require 'lotus/repository'

module Pairoulette::Repositories
  class OfferRepository
    include Lotus::Repository

    # Persist should be prefered over create and update.
    def self.persist(entity)
      entity.updated_at = Time.now
      super(entity)
    end

    def self.visible
      query do
        where{ expires_at >= Time.now }.
          order{ updated_at.desc }
      end
    end
  end
end
