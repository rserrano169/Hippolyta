source 'https://rubygems.org'

# Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish', 'continue' and 'break' commands to control execution.
gem 'pry-byebug'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.7'
# Use sqlite3 as the database for Active Record
gem 'pg', '~> 0.18.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# PgSearch builds Active Record named scopes that take advantage of PostgreSQL's full text search
gem 'pg_search'
# Kaminari is a Scope & Engine based, clean, powerful, agnostic, customizable and sophisticated paginator for Rails 3+
gem 'kaminari'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
# Compile and evaluate EJS (Embedded JavaScript) templates from Ruby.
gem 'ejs', '~> 1.1.1'
# Stripe is the easiest way to accept payments online. See https://stripe.com for details.
gem 'stripe'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'quiet_assets'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'bcrypt-ruby', require: 'bcrypt'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'backbone-on-rails'
# Easy upload management for ActiveRecord
gem 'paperclip', '~> 4.2.1'
# Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file
gem 'figaro', '~> 1.1.0'
# The official AWS SDK for Ruby. Provides both resource oriented interfaces and API clients for AWS services.
gem 'aws-sdk', '< 2.0'


group :development, :test do
  gem 'rspec-rails', '~> 3.2.1'
  gem 'factory_girl_rails'
end

group :test do
  gem "shoulda-matchers"
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end

group :production do
  #Run Rails the 12factor way
  gem 'rails_12factor', '~> 0.0.3'
end
