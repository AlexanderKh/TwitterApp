class Favourite < ApplicationRecord

  belongs_to :favourable, polymorphic: true
  belongs_to :user

  validates_presence_of :favourable, :user
  validates_uniqueness_of :user_id, scope: [:favourable_id, :favourable_type]

  default_scope { order(created_at: :desc) }

  FAVOURABLES = %w(user tweet)
end
