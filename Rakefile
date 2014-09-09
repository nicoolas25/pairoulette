$LOAD_PATH.unshift(__dir__) unless $LOAD_PATH.include?(__dir__)

require 'rspec/core/rake_task'

require_relative './config/env'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :db do
  desc 'Migrate the database'
  task :migrate do
    require 'pairoulette/migrator'
    Domain::Migrator.migrate!
  end

  desc 'Load dummy data'
  task seed: :migrate do
    load './db/seeds.rb'
  end
end
