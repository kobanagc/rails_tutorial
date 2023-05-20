puts "\n☆★☆★☆\ncontrollers/static_pages_controller.rb\n☆★☆★☆\n\n"

class StaticPagesController < ApplicationController
  puts "\n☆★☆★☆\ncontrollers/static_pages_controller.rb\nclass StaticPagesController < ApplicationController\n☆★☆★☆\n\n"

  def home
    puts "\n☆★☆★☆\ncontrollers/static_pages_controller.rb\nclass StaticPagesController < ApplicationController\nhome method\n☆★☆★☆\n\n"
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
    puts "\n☆★☆★☆\ncontrollers/static_pages_controller.rb\nclass StaticPagesController < ApplicationController\nhelp method\n☆★☆★☆\n\n"

  end

  def about
    puts "\n☆★☆★☆\ncontrollers/static_pages_controller.rb\nclass StaticPagesController < ApplicationController\nabout method\n☆★☆★☆\n\n"

  end

  def contact
    puts "\n☆★☆★☆\ncontrollers/static_pages_controller.rb\nclass StaticPagesController < ApplicationController\ncontact method\n☆★☆★☆\n\n"

  end
end