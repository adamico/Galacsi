# galacsi rails3 Gemfile
source 'http://rubygems.org'

gem 'rails', '3.0.4'
gem "haml"
gem "RedCloth"
gem "meta_search"
gem "meta_where"
gem 'acts_as_sanitiled', :git => "https://github.com/kevinansfield/acts_as_sanitiled.git"
gem "state_machine"
gem 'devise'
gem 'cancan'
gem 'formtastic', "1.1.0"
gem "activesupport"
gem "friendly_id", '~> 3.0'
gem 'will_paginate', '3.0.pre2'
gem 'recaptcha'
gem 'comma'

gem 'pg', :group => :production

group :development do
  gem 'sqlite3'
  gem "nifty-generators"
  gem "rails3-generators"
  gem "haml-rails"
  gem "wirble"
  gem "hirb"
  gem 'annotate-models', '1.0.4'
  gem 'faker', '0.3.1'
  gem "hpricot"
  gem "ruby_parser"
end


group :test, :development do
  gem 'rspec-rails', "~> 2.1"
  gem 'rcov'
  gem 'ruby-debug19'
end

group :test do
  gem 'factory_girl_rails', "~> 1.1.beta1"
  gem "autotest"
  gem 'spork', '0.9.0.rc2'
  gem 'capybara'
  gem 'database_cleaner'
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails', "~> 2.1"
  gem 'spork', '0.9.0.rc2'
  gem 'launchy'    # So you can do Then show me the page
  gem 'pickle'
  gem 'factory_girl_rails', "~> 1.1.beta1"
end
