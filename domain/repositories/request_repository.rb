require 'lotus/repository'

module Domain::Repositories
  class RequestRepository
    include Lotus::Repository

    def self.find_all_by_offer_id(offer_id)
      query{ where(offer_id: offer_id) }.all
    end
  end
end
