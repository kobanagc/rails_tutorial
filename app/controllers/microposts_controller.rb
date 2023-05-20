puts "\n☆★☆★☆\ncontrollers/microposts_controller.rb\n☆★☆★☆\n\n"

class MicropostsController < ApplicationController
  puts "\n☆★☆★☆\ncontrollers/microposts_controller.rb\nclass MicropostsController < ApplicationController\n☆★☆★☆\n\n"

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    puts "\n☆★☆★☆\ncontrollers/microposts_controller.rb\nclass MicropostsController < ApplicationController\ncreate method\n☆★☆★☆\n\n"

    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = "Micropost created"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    puts "\n☆★☆★☆\ncontrollers/microposts_controller.rb\nclass MicropostsController < ApplicationController\ndestroy method\n☆★☆★☆\n\n"

    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    puts "\n☆★☆★☆\ncontrollers/microposts_controller.rb\nclass MicropostsController < ApplicationController\nmicropost_params method (private)\n☆★☆★☆\n\n"

    params.require(:micropost).permit(:content, :image)
  end

  def correct_user
    puts "\n☆★☆★☆\ncontrollers/microposts_controller.rb\nclass MicropostsController < ApplicationController\ncorrect_user method (private)\n☆★☆★☆\n\n"

    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
