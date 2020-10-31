class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @follows = current_user.followedd
  end

  def follow
    @follow_user = User.find(params[:id])
    current_user.follow(@follow_user)
    redirect_to home_path_url, :alert => "User followed!"
  end

  def unfollow
    @unfollow_user = User.find(params[:id])
    current_user.unfollow(@unfollow_user)
    redirect_to home_path_url, :alert => "User unfollowed"
  end
end
