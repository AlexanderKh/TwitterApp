class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :omniauthable, :rememberable

end
