FactoryGirl.define do
  factory :tweet do
    user
    content { Faker::Lorem.characters(80) }
  end
end
