class TweetsController < ApplicationController

  before_action :authenticate!

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

  private

  def tweet_params
    params.permit(:content)
  end
end
