class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :omniauthable, :rememberable

  has_many :tweets, dependent: :destroy

end
