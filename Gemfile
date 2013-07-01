source 'https://rubygems.org'

# ruby version
ruby '1.9.3'

# Note: the version number might be different
gem 'rails', '3.2.13'

# use Postgres for db
gem 'pg'

# jquery
gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Gems used only for assets and not required
# in production environments by default
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails'
  gem 'zurb-foundation', '~> 4.0.0'
end

group :development, :test do
  gem "rspec-rails", "~> 2.0"
  gem 'capybara'
  gem 'faker'
end

group :test do
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end