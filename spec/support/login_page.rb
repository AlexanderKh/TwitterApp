require 'support/base_page'

class LoginPage < BasePage

  def page_path
    '/#!/login'
  end

  def fill_form(username:, password:)
    within 'form' do
      fill_in 'Username', with: username
      fill_in 'Password', with: password
    end
  end

  def submit
    within 'form' do
      find('input[type="submit"]').click
    end
  end
end
