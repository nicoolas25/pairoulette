require_relative '../../web/application'

module RSpec
  module FeatureExampleGroup
    def self.included(group)
      group.metadata[:type] = :feature
      Capybara.app = Pairoulette::Web.new
    end
  end
end
