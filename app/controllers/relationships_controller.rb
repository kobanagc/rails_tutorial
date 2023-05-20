puts "\n☆★☆★☆\ncontrollers/relationships_controller.rb\n☆★☆★☆\n\n"

class RelationshipsController < ApplicationController
  puts "\n☆★☆★☆\ncontrollers/relationships_controller.rb\nclass RelationshipsController < ApplicationController\n☆★☆★☆\n\n"

  before_action :logged_in_user

  def create
    puts "\n☆★☆★☆\ncontrollers/relationships_controller.rb\nclass RelationshipsController < ApplicationController\ncreate method\n☆★☆★☆\n\n"

    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    puts "\n☆★☆★☆\ncontrollers/relationships_controller.rb\nclass RelationshipsController < ApplicationController\ndestroy method\n☆★☆★☆\n\n"

    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end