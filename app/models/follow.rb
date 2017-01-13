class Follow < ApplicationRecord
  belongs_to :followee, class_name: User
  belongs_to :follower, class_name: User

  validates_presence_of :followee, :follower
  validates_uniqueness_of :followee_id, scope: :follower_id
end
