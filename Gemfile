# galacsi rails3 Gemfile
source 'http://rubygems.org'

gem 'rails', '3.0.5'
gem "haml"
gem "RedCloth"
gem "meta_search"
gem "meta_where"
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
end

group :cucumber do
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '1.0.1'
  gem 'spork', '~> 0.9.0.rc4'
  gem 'launchy'    # So you can do Then show me the page
  gem 'pickle'
end
