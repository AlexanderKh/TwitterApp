FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name(4) }
    password { 'q1w2e3r4' }
    password_confirmation { 'q1w2e3r4' }
  end
end
