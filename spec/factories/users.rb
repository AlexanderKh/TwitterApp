FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password { 'q1w2e3r4' }
  end
end
