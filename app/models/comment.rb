class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates_presence_of :user, :tweet, :content
  validates_length_of :content, maximum: 100

  default_scope { order(created_at: :desc) }
end
