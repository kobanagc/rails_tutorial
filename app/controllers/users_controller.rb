puts "\n☆★☆★☆\ncontrollers/users_controller.rb\n☆★☆★☆\n\n"

class UsersController < ApplicationController
  puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\n☆★☆★☆\n\n"

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\nindex method\n☆★☆★☆\n\n"

    @users = User.paginate(page: params[:page])
  end

  def new
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\nnew method\n☆★☆★☆\n\n"

    @user = User.new
  end

  def create
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\ncreate method\n☆★☆★☆\n\n"

    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\nshow method\n☆★☆★☆\n\n"

    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def edit
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\nedit method\n☆★☆★☆\n\n"

    @user = User.find(params[:id])
  end

  def update
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\nupdate method\n☆★☆★☆\n\n"

    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\ndestroy method\n☆★☆★☆\n\n"

    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\nfollowing method\n☆★☆★☆\n\n"

    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\nfollowers method\n☆★☆★☆\n\n"

    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
  def user_params
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\nuser_params method (private)\n☆★☆★☆\n\n"

    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\ncorrect_user method (private)\n☆★☆★☆\n\n"

    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    puts "\n☆★☆★☆\ncontrollers/users_controller.rb\nclass UsersController < ApplicationController\nadmin_user method (private)\n☆★☆★☆\n\n"

    redirect_to(root_url) unless current_user.admin?
  end
end