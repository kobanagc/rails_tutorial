puts "\n☆★☆★☆\ncontrollers/account_activations_controller.rb\n☆★☆★☆\n\n"

class AccountActivationsController < ApplicationController
  puts "\n☆★☆★☆\ncontrollers/account_activations_controller.rb\nclass AccountActivationsController < ApplicationController\n☆★☆★☆\n\n"

  def edit
    puts "\n☆★☆★☆\ncontrollers/account_activations_controller.rb\nclass AccountActivationsController < ApplicationController\nedit method\n☆★☆★☆\n\n"

    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
