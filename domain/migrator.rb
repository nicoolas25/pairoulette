require 'sequel'

module Domain
  class Migrator
    def self.migrate!
      db = Sequel.connect(ENV['DATABASE_URL'])

      db.create_table! :offers do
        primary_key :id
        String :uid, null: false, unique: true
        String :email, null: false
        Integer :duration, null: false
        String :summary, null: false, text: true
        String :lang, null: false
        String :comments, text: true
        TrueClass :approved, null: false, default: false
        DateTime :expires_at, null: false
        DateTime :updated_at, null: false
      end

      db.create_table! :requests do
        primary_key :id
        foreign_key :offer_id, :offers
        String :contact, null: false
        String :comments, text: true
      end
    end
  end
end
