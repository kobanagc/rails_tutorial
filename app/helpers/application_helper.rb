puts "\n☆★☆★☆\nhelpers/application_helper.rb\n☆★☆★☆\n\n"

module ApplicationHelper
  puts "\n☆★☆★☆\nhelpers/application_helper.rb\nmodule ApplicationHelper\n☆★☆★☆\n\n"

  def full_title(page_title = '')
    puts "\n☆★☆★☆\nhelpers/application_helper.rb\nmodule ApplicationHelper\nfull_title method\n☆★☆★☆\n\n"

    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
