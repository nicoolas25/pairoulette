require 'lib/form'

module Backend
  class OfferForm < Form
    property :duration, type: Integer
    property :lang
    property :summary
    property :comments

    validates :duration, presence: true, numericality: true
    validates :lang,     presence: true
    validates :summary,  presence: true
  end
end
