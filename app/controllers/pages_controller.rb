class PagesController < ApplicationController
  def home
    @users = User.none
    @tweets = Tweet.where(user_id: current_user.users_following)
                    .or(current_user.tweets)
                    .includes(:user)
    @following = current_user.users_following
    @followers = current_user.get_followers
  end
end
