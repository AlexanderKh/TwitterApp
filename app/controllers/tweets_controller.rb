class TweetsController < ApplicationController

  before_action :authenticate!

  def index
    render json: Tweet.all
  end
end
