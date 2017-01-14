class Api::CommentsController < APIController

  before_action :authenticate!
  before_action :set_tweet

  def create
    comment = @tweet.comments.create(comment_params.merge({ user: current_user }))
    if comment.valid?
      render comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    current_users_comment =  comment.user == current_user
    tweets_owner = @tweet.user == current_user
    head :unathorized unless tweets_owner || current_users_comment
    if comment.destroy
      head :ok
    else
      head 500
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
