# This file is used by Rack-based servers to start the application.
puts "\n☆★☆★☆\nconfig.ru\n☆★☆★☆\n\n"

require_relative 'config/environment'

run Rails.application
