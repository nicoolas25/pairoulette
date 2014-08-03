require_relative './config/env'
require_relative './web/frontend/application'

app = Lotus::Router.new do
  mount Frontend::Application, at: '/'
end

run app
