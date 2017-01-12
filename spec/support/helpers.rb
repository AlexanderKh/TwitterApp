require 'support/auth_page'

def login(user)
  auth_page = AuthPage.new
  auth_page.open
  auth_page.fill_login(username: user.username, password: 'q1w2e3r4')
  auth_page.submit_login
  sleep 0.5
end
