source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0.rc1'

# databases
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# postgresql
gem 'pg', '0.17.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# JSON serializer
gem 'active_model_serializers', '0.9.0'

# authorization
gem 'pundit', '0.3.0'

# text parser
gem 'nokogiri', '1.6.5'

# HTML email formatter
gem 'premailer', '1.8.2'

# CRON
gem 'whenever', '0.9.4'

# slug
gem 'friendly_id', '5.0.4'

# pagination
gem 'will_paginate', '3.0.7'

# geocode
gem 'geocoder', '1.2.6'

# firebase
gem 'firebase', '0.2.2'

group :development do
  # deployment
  # Use Capistrano for deployment
  gem 'capistrano', '3.3.3'
  gem 'capistrano-rails', '1.1.2'
  gem 'capistrano-bundler', '1.1.3'
  gem 'capistrano-rvm', '0.1.2'
# gem 'debugger'

  # rails panel
  gem 'meta_request', '0.3.4'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # tests
  gem 'responders', '~> 2.0'
  gem 'factory_girl_rails', '4.5.0'
  gem 'fuubar', '2.0.0'
  gem 'guard-rspec', '4.3.1'
  gem 'guard-spork', '1.5.1'
  gem 'guard-zeus', '2.0.0'
  gem 'parallel_tests', '1.0.7'
  gem 'rb-fsevent', require: false if RUBY_PLATFORM =~ /darwin/i
  gem 'rspec-rails', '3.1.0'
  gem 'spork-rails', '4.0.0'
  gem 'zeus', '0.15.3'
end
