class Tweet < ApplicationRecord
  belongs_to :user

  validates_presence_of :user
  validates_length_of :content, maximum: 100
end
