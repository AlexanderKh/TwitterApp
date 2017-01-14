RSpec.describe Like do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:tweet) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:tweet) }
  end

  describe 'likes count' do
    let!(:tweet) { create :tweet }

    it 'should update likes count whenever likes are created or destroyed' do
      expect(tweet.likes_count).to eq 0

      3.times { create :like, tweet: tweet }
      expect(tweet.likes_count).to eq 3

      tweet.likes.first.destroy
      expect(tweet.likes_count).to eq 2

      tweet.likes.destroy_all
      expect(tweet.likes_count).to eq 0
    end
  end
end
