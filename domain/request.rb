require 'lotus/model'

module Domain
  class Request
    include Lotus::Entity

    self.attributes = :offer_id, :contact, :comments
  end
end
