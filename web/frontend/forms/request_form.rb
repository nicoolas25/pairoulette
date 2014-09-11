require 'lib/form'

module Frontend
  class RequestForm < Form
    property :offer_id, type: Integer
    property :contact
    property :comments

    validates :offer_id, presence: true, numericality: true
    validates :contact,  presence: true

    validate :offer_exists

    def offer_exists
      offer = Domain::Repositories::OfferRepository.find_by_id(offer_id)
      offer && !offer.expired?
    end
  end
end
