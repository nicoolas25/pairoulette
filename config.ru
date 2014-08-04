$LOAD_PATH.unshift(__dir__) unless $LOAD_PATH.include?(__dir__)

require 'config/env'
require 'web/frontend/application'
require 'web/backend/application'

app = Rack::Cascade.new([
  Backend::Application.new,
  Frontend::Application.new,
])

run app
