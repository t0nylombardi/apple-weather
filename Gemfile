# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.1'

gem 'bootsnap', require: false
gem 'httparty', '~> 0.21.0'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.2'
gem 'redis', '>= 4.0.1'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'tailwindcss-rails', '~> 2.3'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i(windows jruby)

gem 'view_component', '~> 3.10'

group :development, :test do
  gem 'debug', platforms: %i(mri mingw x64_mingw)
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec-rails', '~> 6.1', '>= 6.1.1'
  gem 'rspec-viewcomponent', '~> 0.1.0'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-rails', '~> 2.23', '>= 2.23.1', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
