class Api::TweetsController < APIController

  before_action :authenticate!
  before_action :set_tweet, only: [:update, :destroy]
  before_action :set_public_tweet, only: [:show, :like, :unlike]

  def index
    @tweets = current_user.feed_tweets
  end

  def show
  end

  def create
    tweet = current_user.tweets.create(tweet_params)
    if tweet.valid?
      render tweet
    else
      render json: tweet.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @tweet.update(tweet_params)
      render @tweet
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

  def like
    if @tweet.likes.create(user: current_user)
      head :ok
    else
      head 500
    end
  end

  def unlike
    if @tweet.likes.find_by(user: current_user).destroy
      head :ok
    else
      head 500
    end
  end

  private

  def set_tweet
    @tweet = current_user.tweets.find(params[:id])
  end

  def set_public_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.permit(:content)
  end
end
