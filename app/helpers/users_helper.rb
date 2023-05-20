puts "\n☆★☆★☆\nhelpers/users_helper.rb\n☆★☆★☆\n\n"

module UsersHelper
  puts "\n☆★☆★☆\nhelpers/users_helper.rb\nmodule UsersHelper\n☆★☆★☆\n\n"

  def gravatar_for(user, size: 80)
    puts "\n☆★☆★☆\nhelpers/users_helper.rb\nmodule UsersHelper\ngravatar_for method\n☆★☆★☆\n\n"

    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
