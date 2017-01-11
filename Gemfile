source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Core
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'

# Persistence
gem 'pg'

# Views
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'slim'
gem 'slim-rails'
gem 'angular-rails-templates'

# Rails Assets
gem 'rails-assets-angular'
gem 'rails-assets-angular-route'
gem 'rails-assets-angular-ui-router'
gem 'rails-assets-angular-resource'
gem 'rails-assets-angular-mocks'
gem 'rails-assets-satellizer'
gem 'rails-assets-foundation'
gem 'rails-assets-bootstrap'

# Authentication
gem 'sorcery'
gem 'jwt'
gem 'omniauth'
gem 'omniauth-facebook'

group :development, :test do
  gem 'pry'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'sqlite3'
  gem 'memory_test_fix'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'teaspoon-jasmine'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'poltergeist'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
