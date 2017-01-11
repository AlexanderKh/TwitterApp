ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'capybara/poltergeist'
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

DEBUG = ENV['DEBUG']
if DEBUG
  Capybara.default_driver = :selenium
  Capybara.javascript_driver = :selenium
else
  Capybara.default_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
end
Capybara.default_max_wait_time = 10

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

poltergeist_options = {
    window_size: [1200, 700],
    js_errors: false,
    timeout: 45,
    url_whitelist: ['127.0.0.1']
}
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, poltergeist_options)
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  config.after(:each, type: :feature) do
    page.execute_script('if (localStorage && localStorage.clear) localStorage.clear()')
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

# Forces all threads to share the same connection. This works on
# Capybara because it starts the web server in a thread.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
