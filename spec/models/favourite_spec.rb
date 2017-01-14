RSpec.describe Favourite do

  describe 'associations' do
    it { is_expected.to belong_to(:favourable) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:favourable) }
  end

  describe 'ordering' do
    let(:user) { create(:user) }
    3.times do |i|
      let!(:"fav_#{i}") { create(:favourite, user: user) }
    end

    subject { user.favourites }

    it { is_expected.to eq([fav_2, fav_1, fav_0]) }
  end

end
