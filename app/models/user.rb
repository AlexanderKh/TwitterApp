class User < ApplicationRecord
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follows, foreign_key: :follower_id, dependent: :destroy
  has_many :favourites, foreign_key: :user_id, dependent: :destroy
  has_many :favouriables, as: :favourable, class_name: Favourite, dependent: :destroy
  has_many :authentications, dependent: :destroy

  accepts_nested_attributes_for :authentications

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :password, presence: true, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
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
