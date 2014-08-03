require_relative '../../web/frontend/application'

module RSpec
  module FeatureExampleGroup
    def self.included(group)
      group.metadata[:type] = :feature
      Capybara.app = Lotus::Router.new do
        mount Frontend::Application, at: '/'
      end
    end
  end
end
