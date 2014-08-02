require 'lotus/model'

module Pairoulette
  class Request
    include Lotus::Entity

    self.attributes = :offer_id, :contact, :comments
  end
end
