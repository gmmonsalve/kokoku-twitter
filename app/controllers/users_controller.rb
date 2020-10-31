class UsersController < ApplicationController
  def search
    @query = params[:search]
    if (@query.blank?)
      @users = User.all
    else
      @users = User.where('username LIKE :username', {username: "#@query%"}).take(15)
    end
    render "pages/home"
  end
end
