json.(tweet, :id, :content, :user_id, :created_at)
json.user_name tweet.user.username
json.user_avatar_url tweet.user.avatar.url(:thumb)
json.liked !!tweet.likes.find_by(user: current_user)
