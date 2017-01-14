json.(tweet, :id, :content, :user_id, :created_at, :likes_count)
json.user_name tweet.user.username
json.user_avatar_url tweet.user.avatar.url(:thumb)
json.liked !!tweet.likes.find_by(user: current_user)
json.favourable_id tweet.favouriables.find_by(user_id: current_user.id)&.id
json.type 'tweet'
