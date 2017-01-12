class TweetsController < ApplicationController

  before_action :authenticate!
  before_action :set_tweet, only: [:update, :destroy]

  def index
    render json: Tweet.all
  end

  def create
    tweet = current_user.tweets.create(tweet_params)
    if tweet.valid?
      render json: tweet
    else
      render json: tweet.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: @tweet.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @tweet.destroy
      head :ok
    else
      head 500
    end
  end

  private

  def set_tweet
    @tweet = current_user.tweets.find(params[:id])
  end

  def tweet_params
    params.permit(:content)
  end
end
