FactoryGirl.define do
  factory :favourite do
    user
    favourable { create [:user, :tweet].sample }
  end
end
