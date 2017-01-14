RSpec.describe Comment do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:tweet) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:tweet) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content).is_at_most(100) }
  end

  describe 'ordering' do
    let(:tweet) { create(:tweet) }
    3.times do |i|
      let!(:"comment_#{i}") { create(:comment, tweet: tweet) }
    end

    subject { tweet.comments }

    it { is_expected.to eq([comment_2, comment_1, comment_0]) }
  end

end
