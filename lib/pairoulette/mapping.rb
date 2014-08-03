require 'lotus/model/mapper'

require 'pairoulette/offer'
require 'pairoulette/request'
require 'pairoulette/repositories/offer_repository'
require 'pairoulette/repositories/request_repository'

require 'lotus/model/adapters/sql_adapter'

module Pairoulette
  @@mapping = Lotus::Model::Mapper.new do
    collection :offers do
      entity     Offer
      repository Repositories::OfferRepository

      attribute :id,         Integer
      attribute :uid,        String
      attribute :email,      String
      attribute :duration,   Integer
      attribute :summary,    String
      attribute :lang,       String
      attribute :comments,   String
      attribute :approved,   Boolean
      attribute :expires_at, DateTime
      attribute :updated_at, DateTime
    end

    collection :requests do
      entity     Request
      repository Repositories::RequestRepository

      attribute :id,       Integer
      attribute :offer_id, Integer
      attribute :contact,  String
      attribute :comments, String
    end
  end

  def self.mapping
    @@mapping
  end

  def self.load!
    adapter = Lotus::Model::Adapters::SqlAdapter.new(mapping, ENV['DATABASE_URL'])

    Repositories::OfferRepository.adapter   = adapter
    Repositories::RequestRepository.adapter = adapter

    mapping.load!
  end
end
