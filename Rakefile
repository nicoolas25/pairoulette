$LOAD_PATH.unshift(__dir__) unless $LOAD_PATH.include?(__dir__)

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Launch an interactive console'
task :console do
  require 'irb'
  require 'config/env'
  require 'domain'
  ARGV.clear
  IRB.start
end

namespace :db do
  desc 'Migrate the database'
  task :migrate do
    require 'config/env'
    require 'domain/migrator'
    Domain::Migrator.migrate!
  end

  desc 'Load dummy data'
  task seed: :migrate do
    require 'config/env'
    load './db/seeds.rb'
  end
end
