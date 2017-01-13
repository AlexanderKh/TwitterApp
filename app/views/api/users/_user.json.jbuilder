json.(user, :id, :username)
json.current_user user == current_user
json.following current_user.follows.find_by(followee_id: user.id)
json.avatar_thumb_url user.avatar.url(:thumb)
json.avatar_medium_url user.avatar.url(:medium)
