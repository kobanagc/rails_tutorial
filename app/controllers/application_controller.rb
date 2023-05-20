puts "\n☆★☆★☆\ncontrollers/application_controller.rb\n☆★☆★☆\n\n"

class ApplicationController < ActionController::Base
  puts "\n☆★☆★☆\ncontrollers/application_controller.rb\nclass ApplicationController < ActionController::Base\n☆★☆★☆\n\n"

  include SessionsHelper

  private
  def logged_in_user
    puts "\n☆★☆★☆\ncontrollers/application_controller.rb\nclass ApplicationController < ActionController::Base\nlogged_in_user method\n☆★☆★☆\n\n"

    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end
end
