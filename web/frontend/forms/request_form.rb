require 'lib/form'

module Frontend
  class RequestForm < Form
    property :offer_id, type: Integer
    property :contact
    property :comments

    validates :offer_id, presence: true, numericality: true
    validates :contact,  presence: true

    validate :offer_exists
    validate :one_request_by_contact

    def offer_exists
      offer = Domain::Repositories::OfferRepository.find_by_id(offer_id)
      offer && !offer.expired?
    end

    def one_request_by_contact
      Domain::Repositories::RequestRepository.find_like({
        offer_id: offer_id,
        contact: contact,
      }).nil?
    end
  end
end
