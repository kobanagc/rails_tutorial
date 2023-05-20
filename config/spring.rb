puts "\n☆★☆★☆\nconfig/spring.rb\n☆★☆★☆\n\n"

Spring.watch(
  ".ruby-version",
  ".rbenv-vars",
  "tmp/restart.txt",
  "tmp/caching-dev.txt"
)
