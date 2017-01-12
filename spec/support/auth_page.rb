require 'support/base_page'

class AuthPage < BasePage

  def page_path
    '/#!/login'
  end

  def fill_login(username:, password:)
    within '.login-form' do
      fill_in 'Username', with: username
      fill_in 'Password', with: password
    end
  end

  def submit_login
    within '.login-form' do
      find('button[type="submit"]').click
    end
  end

  def fill_registration(username:, password:)
    within '.registration-form' do
      fill_in 'Username', with: username
      fill_in 'Password', with: password
      fill_in 'Password Confirmation', with: password
    end
  end

  def submit_registration
    within '.registration-form' do
      find('button[type="submit"]').click
    end
  end
end
