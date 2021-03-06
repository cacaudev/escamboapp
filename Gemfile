source 'https://rubygems.org'

gem 'bundler', '>= 1.8.4'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

source 'https://rails-assets.org' do
  # Bootstrap
  gem 'rails-assets-bootstrap', '3.3.7'
  # NotifyJS
  gem 'rails-assets-notifyjs'
  # BootboxJS
  gem 'rails-assets-bootbox'
end

# Repository for collecting Locale data for Ruby on Rails I18n
# as well as other interesting, Rails related I18n stuff
gem 'rails-i18n'
# Manage Procfile-based applications
gem 'foreman'
# Flexible authentication solution for Rails with Warden.
gem 'devise'
# Translations for the devise gem
gem 'devise-i18n'
# Help ActiveRecord::Enum feature to work fine with I18n and simple_form.
gem 'enum_help'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Rails gem of the template Bootstrap based admin theme SB Admin 2
gem 'bootstrap_sb_admin_base_v2'
# Minimal authorization through OO design and pure Ruby classes
gem "pundit"
# Integration of RubyMoney - Money with Rails
gem 'money-rails'
# Easy file attachment management for ActiveRecord 
gem 'paperclip', '>= 5.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution
  # and get a debugger console
  gem 'byebug'
  # Better error page for Rack apps
  gem 'better_errors'
  # Mutes assets pipeline log messages
  gem 'quiet_assets'
  # Generate Entity-Relationship Diagrams for Rails applications
  gem 'rails-erd'
  # Fake info generator
  gem 'faker'
  # Fake sentences or paragraphs 
  gem 'lerolero_generator'
  # A Ruby static code analyzer and formatter,
  # based on the community Ruby style guide.
  gem 'rubocop', '~> 0.59.2', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the
  # background
  gem 'spring'
  gem 'mailcatcher'
end

group :production do
  gem 'pg'
  gem 'puma'
end