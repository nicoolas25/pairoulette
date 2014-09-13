require 'lotus/repository'

module Domain::Repositories
  class RequestRepository
    include Lotus::Repository

    def self.find_by_id(id)
      query{ where(id: id) }.first
    end

    def self.find_all_by_offer_id(offer_id)
      query{ where(offer_id: offer_id) }.all
    end

    def self.find_like(attribute_hash)
      query{ where(attribute_hash) }.first
    end
  end
end
