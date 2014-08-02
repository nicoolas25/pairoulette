$LOAD_PATH.unshift('./lib')

ENV['RACK_ENV'] = ENV['LOTUS_ENV'] ||= 'development'

require 'dotenv/deployment'
require 'pairoulette'
Pairoulette.load!
