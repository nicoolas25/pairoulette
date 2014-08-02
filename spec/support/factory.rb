require 'faker'
require 'pairoulette/offer'

module Factory
  ORDER_LANGS = %w(fr en es de).freeze

  def self.offer(attributes = {})
    default = {
      email: Faker::Internet.email,
      duration: 30 + (rand(7) * 10),
      lang: 2.times.map { ORDER_LANGS.sample }.join(' '),
      summary: Faker::Lorem.sentence,
    }
    attributes = default.merge(attributes)
    Pairoulette::Offer.new(attributes)
  end

  def self.expired_offer(attributes = {})
    default = {
      expires_at: Chronic.parse('yesterday'),
    }
    attributes = default.merge(attributes)
    offer(attributes)
  end
end
