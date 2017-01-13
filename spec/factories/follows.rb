FactoryGirl.define do
  factory :follow do
    follower { create :user }
    followee { create :user }
  end
end
