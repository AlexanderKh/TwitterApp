class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follows, foreign_key: :follower_id, dependent: :destroy
  has_many :favourites, foreign_key: :user_id, dependent: :destroy
  has_many :favouriables, as: :favourable, class_name: Favourite, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: 'empty-avatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def feed_tweets
    user_ids = follows.pluck(:followee_id).to_a | [id]
    Tweet.by_user_ids(user_ids)
  end

end
