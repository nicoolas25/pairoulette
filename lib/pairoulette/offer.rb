require 'lotus/model'
require 'securerandom'

require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/time/calculations'
require 'active_support/core_ext/numeric/time'

module Pairoulette
  class Offer
    EXPIRATION_DELAY = 7.days

    include Lotus::Entity

    self.attributes = :uid, :email, :duration, :summary, :lang, :comments, :approved, :expires_at, :updated_at

    def uid
      @uid ||= SecureRandom.uuid
    end

    def approved
      @approved = false if @approved.nil?
      @approved
    end

    def expires_at
      @expires_at ||= Time.now + EXPIRATION_DELAY
    end
  end
end
