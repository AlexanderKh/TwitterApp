FactoryGirl.define do
  factory :comment do
    user
    tweet
    content { Faker::Lorem.characters(50) }
  end
end
