require 'bundler'

require 'rspec'
RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = 'documentation'
end

require 'flightstats'
# Update these if you want to run remote tests (rake test:remote:spec)
FlightStats.app_id = 'test_app_id'
FlightStats.app_key = 'test_key'

require 'logger'
FlightStats.logger = Logger.new STDOUT
FlightStats.logger.level = Logger::INFO