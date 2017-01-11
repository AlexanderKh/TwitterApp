feature 'Authorization' do
  let(:login_page) { LoginPage.new(root_path) }
  let(:registration_page) { RegistrationPage.new(root_path) }

  context 'with user' do
    let(:user) { create(:user) }

    scenario 'login' do
      login_page.open
      login_page.fill_form(username: user.username, password: 'q1w2e3r4')
      login_page.submit

      expect(page).to have_content('Logout')
    end
  end

  context 'without user' do
    let(:user_info) { {
      username: Faker::Internet.user_name,
      password: 'q1w2e3r4'
    } }

    scenario 'registration' do
      registration_page.open
      registration_page.fill_form(user_info)
      registration_page.submit

      expect(page).to have_content('Logout')

      new_user = User.last
      expect(new_user.username).to eq(user_info[:username])
    end
  end
end
