# galacsi rails3 Gemfile
source 'http://rubygems.org'

gem 'rails', '3.2.11'

gem "haml"
gem "RedCloth"
#gem "meta_search"
#gem "meta_where"
gem "state_machine"
gem 'devise'
gem 'cancan'
gem 'formtastic'
gem "activesupport"
gem "friendly_id"
gem 'will_paginate'
gem 'recaptcha'
gem 'comma'

group :production do
  gem 'pg'
  gem 'rack-google_analytics', :require => "rack/google_analytics"
end

group :development do
  gem 'sqlite3'
  gem "haml-rails"
end


group :test, :development do
  gem 'rspec-rails'
end

group :cucumber do
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'pickle'
end
