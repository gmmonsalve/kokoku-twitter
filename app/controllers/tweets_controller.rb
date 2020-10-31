class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = current_user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  #POST para guardar en la base de datos
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.body.length > 280
      redirect_to home_path_url, :alert => "You can't create a tweet with more than 280 characters"
    else
      @tweet.save
      redirect_to home_path_url
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  #DELETE para eliminar de la base de datos
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to home_path_url, :notice => "Your tweet has been deleted"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
