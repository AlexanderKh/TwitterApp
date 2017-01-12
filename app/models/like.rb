class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates_presence_of :user, :tweet
  validates_uniqueness_of :user_id, scope: :tweet_id
end
