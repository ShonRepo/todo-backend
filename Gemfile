source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

#######
### default
#######

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.7'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 4.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

######
### application
######

# Psych is a YAML parser and emitter
# https://github.com/ruby/psych
gem 'psych'

# Rack middleware for blocking & throttling abusive requests
# https://github.com/kickstarter/rack-attack
gem 'rack-attack'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Rack::UTF8Sanitizer is a Rack middleware which cleans up invalid UTF8 characters in request URI and headers.
# https://github.com/whitequark/rack-utf8_sanitizer
gem 'rack-utf8_sanitizer'

# Simple Rails app configuration
# https://github.com/laserlemon/figaro
gem 'figaro'

# Build JSON APIs with ease.
# Read more:https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# This gem gives every ActiveRecord::Base object the possibility to do a deep clone that includes user specified associations.
# https://github.com/moiristo/deep_cloneable
gem 'deep_cloneable'

# Daemons provides an easy way to wrap existing ruby scripts to be run as a daemon and to be controlled by simple start/stop/restart commands.
# https://github.com/thuehlinger/daemons
gem 'daemons'

# A scheduler process to replace cron.
# https://github.com/Rykian/clockwork
gem 'clockwork', git: 'https://github.com/Rykian/clockwork.git', branch: 'master'

# Delayed::Job (or DJ) encapsulates the common pattern of asynchronously executing longer tasks in the background.
# https://github.com/collectiveidea/delayed_job
gem 'delayed_job_active_record'


######
### auth
#####

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# A ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
# https://github.com/jwt/ruby-jwt
gem 'jwt'

# OpenID Connect Server & Client Library
# https://github.com/nov/openid_connect
gem 'openid_connect'

# The authorization Gem for Ruby on Rails
# https://github.com/CanCanCommunity/cancancan
gem 'cancancan'

######
### Documentation
######

# Apipie-rails is a DSL and Rails engine for documenting your RESTful API
gem 'apipie-rails'

######
### development
######

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # https://github.com/rails/web-console
  gem 'web-console', '>= 3.3.0'

  # Manage Procfile-based applications
  # https://github.com/ddollar/foreman
  gem 'foreman'

  # https://github.com/guard/listen
  gem 'listen', '~> 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # A runtime developer console and IRB alternative with powerful introspection capabilities
  # https://github.com/rweng/pry-rails
  gem 'pry-rails'
end

######
### test
######

group :test do
  # Adds support for Capybara system testing and selenium driver
  # https://github.com/teamcapybara/capybara
  gem 'capybara', '>= 2.15'

  # This gem provides Ruby bindings for WebDriver and has been tested to work on MRI (2.0 through 2.2)
  # https://github.com/SeleniumHQ/selenium/tree/master/rb
  gem 'selenium-webdriver'

  # Easy installation and use of web drivers to run system tests with browsers
  # https://github.com/titusfortner/webdrivers
  gem 'webdrivers'

  # A library for setting up Ruby objects as test data
  # https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails'

  # Brings the RSpec testing framework to Ruby on Rails as a drop-in alternative to its default testing framework, Minitest
  # https://github.com/rspec/rspec-rails
  gem 'rspec-rails'

  # Test existence of your Rails callbacks without having to call them
  # https://github.com/jdliss/shoulda-callback-matchers
  gem 'shoulda-callback-matchers'

  # Simple one-liner tests for common Rails functionality
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers'
end

######
### development && test
######

group :development, :test do
  # A Ruby static code analyzer and formatter, based on the community Ruby style guide
  # https://github.com/rubocop-hq/rubocop
  # gem 'rubocop'
  gem 'rubocop', '~> 0.67.2'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # https://github.com/deivid-rodriguez/byebug
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Seedbank allows you to structure your Rails seed data instead of having it all dumped into one large file.
  # https://github.com/jobtitude/seedbank
  gem 'seedbank', git: 'https://github.com/jobtitude/seedbank.git', branch: 'nested-folders'

  # Database Cleaner is a set of gems containing strategies for cleaning your database in Ruby.
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
