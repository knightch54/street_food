# Load the Rails application.
require_relative "application"

Rails.application.configure do
  # Activate logger
  Rails.logger = Logger.new(STDOUT)
  config.logger = ActiveSupport::Logger.new("log/#{Rails.env}.log")
end

# Initialize the Rails application.
Rails.application.initialize!