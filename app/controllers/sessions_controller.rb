puts "\n☆★☆★☆\ncontrollers/sessions_controller.rb\n☆★☆★☆\n\n"

class SessionsController < ApplicationController
  puts "\n☆★☆★☆\ncontrollers/sessions_controller.rb\nclass SessionsController < ApplicationController\n☆★☆★☆\n\n"

  def new
    puts "\n☆★☆★☆\ncontrollers/sessions_controller.rb\nclass SessionsController < ApplicationController\nnew method\n☆★☆★☆\n\n"
  end

  def create
    puts "\n☆★☆★☆\ncontrollers/sessions_controller.rb\nclass SessionsController < ApplicationController\ncreate method\n☆★☆★☆\n\n"

    user = User.find_by(email: params[:session][:email].downcase)
    if user &.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    puts "\n☆★☆★☆\ncontrollers/sessions_controller.rb\nclass SessionsController < ApplicationController\ndestroy method\n☆★☆★☆\n\n"

    log_out if logged_in?
    redirect_to root_url
  end
end