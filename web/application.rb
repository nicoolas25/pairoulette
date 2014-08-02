require 'lotus'

module Pairoulette
  class Web < Lotus::Application
    configure do
      root __dir__

      routes do
        get '/', to: 'home#index', as: :home
        get '/submit', to: 'offers#new', as: :new_offer
      end

      load_paths << [
        'controllers',
        'presenters',
        'views'
      ]

      layout    :application

      templates 'templates'
      assets    'public'
    end
  end
end
