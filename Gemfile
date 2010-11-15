# galacsi rails2 Gemfile

source :rubygems

gem 'pg', :group => :production

unless ENV.has_key?('SSH_CLIENT')
  group :development do
    gem 'sqlite3-ruby', :require => 'sqlite3'
    gem "wirble"
    gem "hirb"
    gem 'annotate-models', '1.0.4'
  end
  group :test, :development do
    gem 'rspec', "~> 1.2.0"
    gem 'rspec-rails', "~> 1.2.0"
    gem 'factory_girl'
    gem 'rcov'
  end
  group :cucumber do
    gem 'capybara'
    gem 'database_cleaner'
    gem 'cucumber-rails'
    gem 'cucumber'
    gem 'rspec-rails', "~> 1.2.0"
    gem 'spork'
    gem 'launchy'    # So you can do Then show me the page
    gem 'pickle'
    gem 'factory_girl'
  end
end

gem 'rails', '2.3.10'
gem 'haml', '3.0.18'
gem 'RedCloth'
gem 'acts_as_sanitiled'
gem 'searchlogic'
gem 'state_machine'
gem 'devise', '1.0.7'
gem 'cancan'
gem 'formtastic'
gem 'activesupport'
gem 'friendly_id', '3.1.6'
gem 'will_paginate'
gem 'recaptcha', :require => "recaptcha/rails"
gem 'fastercsv'
gem 'comma'
