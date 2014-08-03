require 'lotus'

module Backend
  class Application < Lotus::Application
    configure do
      root __dir__

      routes do
        namespace 'backend' do
          get  '/:uid', to: 'offers#monitor', as: :monitor
          post '/:uid', to: 'offers#update',  as: :update
        end
      end

      load_paths << [
        'controllers',
        'presenters',
        'views'
      ]

      layout    :backend

      templates 'templates'
      assets    '../public'
    end
  end
end
