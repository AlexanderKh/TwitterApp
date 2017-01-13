RSpec.describe Follow do

  describe 'associations' do
    it { is_expected.to belong_to(:follower).class_name(User) }
    it { is_expected.to belong_to(:followee).class_name(User) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:follower) }
    it { is_expected.to validate_presence_of(:followee) }
  end


end
