require 'lotus'

module Frontend
  class Application < Lotus::Application
    configure do
      root __dir__

      routes do
        get  '/',       to: 'home#index',    as: :home
        get  '/about',  to: 'home#about',    as: :about
        get  '/submit', to: 'offers#new',    as: :new_offer
        post '/submit', to: 'offers#create', as: :create_offer
      end

      load_paths << [
        'controllers',
        'presenters',
        'views'
      ]

      layout    :frontend

      templates 'templates'
      assets    '../public'
    end
  end
end
