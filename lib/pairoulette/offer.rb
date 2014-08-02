require 'lotus/model'
require 'securerandom'

module Pairoulette
  class Offer
    include Lotus::Entity

    self.attributes = :uid, :email, :duration, :summary, :lang, :comments, :approved, :expires_at

    # Define the default value for the uid.
    def uid
      @uid ||= SecureRandom.uuid
    end
  end
end
