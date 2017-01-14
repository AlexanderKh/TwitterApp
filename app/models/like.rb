class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates_presence_of :user, :tweet
  validates_uniqueness_of :user_id, scope: :tweet_id

  after_create :add_likes_count
  after_destroy :subtract_likes_count


  def add_likes_count
    tweet.update_attributes(likes_count: tweet.likes_count + 1)
  end

  def subtract_likes_count
    tweet.update_attributes(likes_count: tweet.likes_count - 1)
  end
end
