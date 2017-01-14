FactoryGirl.define do
  factory :comment do
    user
    tweet
    content { Faker::Lorem.characters(20) }
  end
end
