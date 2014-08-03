require_relative './config/env'
require_relative './web/frontend/application'
require_relative './web/backend/application'

app = Rack::Cascade.new([
  Backend::Application.new,
  Frontend::Application.new,
])
run app
