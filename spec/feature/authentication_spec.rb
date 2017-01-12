feature 'Authorization' do
  let(:auth_page) { AuthPage.new(root_path) }

  context 'with user' do
    let(:user) { create(:user) }

    scenario 'login' do
      auth_page.open
      auth_page.fill_login(username: user.username, password: 'q1w2e3r4')
      auth_page.submit_login

      expect(page).to have_content('Logout')
    end
  end

  context 'without user' do
    let(:user_info) { {
      username: Faker::Internet.user_name,
      password: 'q1w2e3r4'
    } }

    scenario 'registration' do
      auth_page.open
      auth_page.fill_registration(user_info)
      auth_page.submit_registration
      expect(page).to have_content('Logout')

      new_user = User.last
      expect(new_user.username).to eq(user_info[:username])
    end
  end
end
