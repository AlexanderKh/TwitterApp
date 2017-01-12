class Tweet < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :content
  validates_length_of :content, maximum: 100

  default_scope { order(created_at: :desc) }
end
