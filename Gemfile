# galacsi rails3 Gemfile
source 'http://rubygems.org'

gem 'rails', '3.2.11'
gem 'pg'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '~> 2.2.1.1'
  gem 'jquery-ui-rails'
end

gem 'jquery-rails'

gem "haml"
gem "RedCloth"
gem "ransack"
gem "state_machine"
gem 'devise'
gem 'cancan'
gem 'simple_form'
gem "activesupport"
gem "friendly_id"
gem "kaminari"
gem 'humanizer'
gem "cocoon", "~> 1.1.2"
gem "turbolinks"
gem "jquery-turbolinks"

group :production do
  gem 'rack-google_analytics', :require => "rack/google_analytics"
end

group :development do
  gem 'meta_request'
  gem "better_errors"
  gem "binding_of_caller"
  gem "pry-rails"
  gem "quiet_assets", ">= 1.0.1"
  gem "haml-rails"
end

group :test do
  gem 'factory_girl_rails'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'simplecov'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'capybara'
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'pickle'
end
