json.(user, :id, :username)
json.current_user user == current_user
json.following current_user.follows.find_by(followee_id: user.id)
