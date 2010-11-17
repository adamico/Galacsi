# galacsi rails3 Gemfile
source :rubygems

gem 'rails', '3.0.1'

gem 'pg', :group => :production

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
gem 'will_paginate', '3.0.pre'
gem 'pickle'
gem 'recaptcha'
gem 'comma'

group :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
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
  gem 'rspec-rails', "~> 2.0.1"
  gem 'rcov'
end

group :test do
  gem 'factory_girl_rails'
  gem "autotest"
  gem 'spork'
  gem 'capybara'
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails', "~> 2.0.1"
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'pickle'
  gem 'factory_girl_rails'
end
