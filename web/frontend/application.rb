require 'lotus'

module Frontend
  class Application < Lotus::Application
    configure do
      root __dir__

      routes do
        get  '/',       to: 'home#index',    as: :home
        get  '/submit', to: 'offers#new',    as: :new_offer
        post '/submit', to: 'offers#create', as: :create_offer
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
