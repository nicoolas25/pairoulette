require 'faker'

require 'domain/offer'
require 'domain/request'

module Factory
  ORDER_LANGS = %w(fr en).freeze

  def self.offer(attributes = {})
    default = {
      email: Faker::Internet.email,
      duration: 30 + (rand(7) * 10),
      lang: ORDER_LANGS.sample,
      summary: Faker::Lorem.paragraph(2, false, 3),
      comments: Faker::Lorem.paragraph(1, false, 2),
    }
    attributes = default.merge(attributes)
    Domain::Offer.new(attributes)
  end

  def self.expired_offer(attributes = {})
    default = {
      expires_at: Chronic.parse('yesterday'),
    }
    attributes = default.merge(attributes)
    offer(attributes)
  end

  def self.request(attributes = {})
    default = {
      contact: Faker::Internet.email,
      comments: Faker::Lorem.paragraph(1, false, 2),
    }
    attributes = default.merge(attributes)
    Domain::Request.new(attributes)
  end
end
