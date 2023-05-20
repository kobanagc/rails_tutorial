puts "\n☆★☆★☆\njobs/application_job.rb\n☆★☆★☆\n\n"

class ApplicationJob < ActiveJob::Base
  puts "\n☆★☆★☆\njobs/application_job.rb\nclass ApplicationJob < ActiveJob::Base\n☆★☆★☆\n\n"

  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
end
