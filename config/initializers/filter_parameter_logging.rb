# Be sure to restart your server when you modify this file.

puts "\n☆★☆★☆\nconfig/initializers/filter_parameter_logging.rb\n☆★☆★☆\n\n"

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:password]
