puts "\n☆★☆★☆\ncontrollers/password_resets_controller.rb\n☆★☆★☆\n\n"

class PasswordResetsController < ApplicationController
  puts "\n☆★☆★☆\ncontrollers/password_resets_controller.rb\nclass PasswordResetsController < ApplicationController\n☆★☆★☆\n\n"

  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edid, :update]

  def new
    puts "\n☆★☆★☆\ncontrollers/password_resets_controller.rb\nclass PasswordResetsController < ApplicationController\nnew method\n☆★☆★☆\n\n"
  end

  def create
    puts "\n☆★☆★☆\ncontrollers/password_resets_controller.rb\nclass PasswordResetsController < ApplicationController\ncreate method\n☆★☆★☆\n\n"

    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
    puts "\n☆★☆★☆\ncontrollers/password_resets_controller.rb\nclass PasswordResetsController < ApplicationController\nedit method\n☆★☆★☆\n\n"
  end

  def update
    puts "\n☆★☆★☆\ncontrollers/password_resets_controller.rb\nclass PasswordResetsController < ApplicationController\nupdate method\n☆★☆★☆\n\n"

    if params[:user][:password].empty?
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update(user_params)
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    puts "\n☆★☆★☆\ncontrollers/password_resets_controller.rb\nclass PasswordResetsController < ApplicationController\nuser_params method (private)\n☆★☆★☆\n\n"

    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    puts "\n☆★☆★☆\ncontrollers/password_resets_controller.rb\nclass PasswordResetsController < ApplicationController\nget_user method (private)\n☆★☆★☆\n\n"

    @user = User.find_by(email: params[:email])
  end

  def valid_user
    puts "\n☆★☆★☆\ncontrollers/password_resets_controller.rb\nclass PasswordResetsController < ApplicationController\nvalid_user method (private)\n☆★☆★☆\n\n"

    unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  def check_expiration
    puts "\n☆★☆★☆\ncontrollers/password_resets_controller.rb\nclass PasswordResetsController < ApplicationController\ncheck_expiration method (private)\n☆★☆★☆\n\n"

    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end
end