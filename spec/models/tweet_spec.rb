RSpec.describe Tweet do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content).is_at_most(100) }
  end

  describe 'ordering' do
    3.times do |i|
      let!(:"tweet_#{i}") { create(:tweet) }
    end

    subject { Tweet.all }

    it { is_expected.to eq([tweet_2, tweet_1, tweet_0]) }
  end

  describe '#feed_tweets' do
    let(:follow) { create :follow }
    let(:followee) { follow.followee }
    let(:follower) { follow.follower }
    let!(:own_tweet) { create :tweet, user: follower }

    subject { follower.feed_tweets }

    context 'without followed tweet' do
      it { should eq [own_tweet] }
    end

    context 'with followed tweet' do
      let!(:followed_tweet) { create :tweet, user: followee }

      it { should eq [followed_tweet, own_tweet] }
    end

  end
end
