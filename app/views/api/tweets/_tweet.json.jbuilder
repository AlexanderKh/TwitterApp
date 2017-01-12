json.(tweet, :id, :content, :user_id)
json.user_name tweet.user.username
json.liked !!tweet.likes.find_by(user: current_user)
