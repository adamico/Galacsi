source 'http://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.0.12'

gem 'RedCloth',      '~> 4.2.9'
gem 'activesupport'
gem 'cancancan',     '~> 1.10'
gem 'coffee-rails', '~> 4.0.0'
gem 'comma'
gem 'devise'
gem 'formtastic',    '~> 3.0'
gem 'friendly_id',   '~> 3.0'
gem 'haml'
gem 'jquery-rails'
#gem 'meta_search'
#gem 'meta_where'
gem 'pg'
gem 'puma'
gem 'recaptcha'
gem 'sass-rails', '~> 4.0.2'
gem 'state_machine'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '~> 3.0.6'

group :production do
  gem 'rack-google_analytics', :require => "rack/google_analytics"
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
  gem "nifty-generators"
  gem "rails3-generators"
  gem "haml-rails"
  gem "wirble"
  gem "hirb"
  gem 'annotate'
  gem 'faker', '0.3.1'
  gem "hpricot"
  gem "ruby_parser"
end


group :test, :development do
  gem 'rspec-rails', "~> 2.1"
  #gem 'rcov'
end

group :cucumber do
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'spork', '~> 0.9.0.rc4'
  gem 'launchy'    # So you can do Then show me the page
  gem 'pickle'
end
