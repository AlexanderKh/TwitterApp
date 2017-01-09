class TweetsController < ApplicationController

  # before_action :authenticate_user!

  def index
    render json: Tweet.all
  end
end
