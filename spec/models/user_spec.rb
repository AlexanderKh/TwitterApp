RSpec.describe User do

  describe 'associations' do
    it { is_expected.to have_many(:tweets).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:follows).dependent(:destroy) }
    it { is_expected.to have_many(:favourites).dependent(:destroy) }
    it { is_expected.to have_many(:favouriables).dependent(:destroy) }
    it { is_expected.to have_many(:authentications).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_least(4) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
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
