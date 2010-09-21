source 'http://rubygems.org'

gem 'rails', '3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "haml"
gem "RedCloth"
gem "meta_search"
gem "meta_where"
gem "state_machine"
gem 'devise', '1.1.rc1'
gem 'cancan'
gem 'formtastic'
gem "activesupport"
gem "friendly_id", '~> 3.0'
gem 'will_paginate', '3.0.pre'
gem 'pickle'
gem 'recaptcha', :git => 'http://github.com/adamico/recaptcha.git', :require => "recaptcha/rails"

group :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem "nifty-generators"
  gem "rails3-generators"
  gem "haml-rails"
  gem "wirble"
  gem "hirb"
  gem 'annotate-models', '1.0.4'
  gem 'faker', '0.3.1'
end


group :test, :development do
  gem "rspec-rails", ">= 2.0.0.beta.20"
  gem "webrat"
end

group :test do
  gem 'factory_girl_rails'
  gem "ZenTest"
  gem "autotest-notification"
  gem "autotest-rails"
  gem 'spork'
  gem "webrat"
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails', ">= 2.0.0.beta.20"
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'factory_girl_rails'
end
