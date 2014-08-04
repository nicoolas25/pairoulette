require 'web/frontend/application'
require 'web/backend/application'

module RSpec
  module FeatureExampleGroup
    def self.included(group)
      group.metadata[:type] = :feature
      app = Rack::Cascade.new([
        Backend::Application.new,
        Frontend::Application.new,
      ])
      Capybara.app = app
    end
  end
end
