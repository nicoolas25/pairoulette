require 'domain/migrator'

Domain::Migrator.migrate!
Domain.load!
