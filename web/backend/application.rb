require 'lotus'

module Backend
  class Application < Lotus::Application
    configure do
      root __dir__

      routes do
        namespace 'backend' do
          get    '/:uid',              to: 'offers#monitor',   as: :monitor
          post   '/:uid',              to: 'offers#update',    as: :update
          delete '/:uid/requests/:id', to: 'requests#destroy', as: :delete_request
        end
      end

      load_paths << [
        'controllers',
        'presenters',
        'views',
        'forms',
      ]

      layout    :backend

      templates 'templates'
      assets    '../public'

      # This allows us to do the "_method" param trick
      middleware.use 'Rack::MethodOverride'
    end
  end
end
