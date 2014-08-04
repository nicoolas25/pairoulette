ENV['RACK_ENV'] = ENV['LOTUS_ENV'] ||= 'development'

require 'dotenv/deployment'

require 'domain'
Domain.load!

# FIXME: Shut down an activesupport warning with i18n. The app is not using it,
# that's too bad that it's imported.
I18n.enforce_available_locales = false if defined?(I18n)
