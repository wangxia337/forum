source 'http://rubygems.org'

gem 'rails', '3.1.0.rc8'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2', '~> 0.3'
gem 'haml', '~> 3.0.22'
gem 'gravatar_image_tag', '1.0.0'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

group :test, :development do
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'rspec-rails', '2.6.1' 
end

group :development do
  gem 'annotate', '2.4.0'
  gem 'faker', '0.3.1'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'webrat'
end
