require 'lotus/repository'

module Domain::Repositories
  class OfferRepository
    include Lotus::Repository

    # Persist should be prefered over create and update.
    # @override
    def self.persist(entity)
      entity.updated_at = Time.now
      super(entity)
    end

    def self.visible
      query do
        where{ expires_at >= Time.now }.
          desc(:updated_at)
      end
    end

    def self.find_by_uid(uid)
      query{ where(uid: uid) }.first
    end
  end
end
