RSpec.describe Like do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:tweet) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:tweet) }
  end

  describe 'ordering' do
    3.times do |i|
      let!(:"tweet_#{i}") { create(:tweet) }
    end

    subject { Tweet.all }

    it { is_expected.to eq([tweet_2, tweet_1, tweet_0]) }
  end
end
