require 'support/base_page'

class RegistrationPage < BasePage

  def page_path
    '/#!/register'
  end

  def fill_form(username:, password:)
    within 'form' do
      fill_in 'Username', with: username
      fill_in 'Password', with: password
      fill_in 'Password Confirmation', with: password
    end
  end

  def submit
    within 'form' do
      find('input[type="submit"]').click
    end
  end
end
