source 'http://rubygems.org'

gem 'rails'

gem 'mysql2'

gem 'capistrano', '2.15.5'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
end

gem 'jquery-rails'

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end

gem "browsercms", github: 'Fryie/browsercms', branch: '3.5.x-js-fix'

group :production do
  gem 'uglifier'
  gem 'therubyracer'
end

group :development, :test do
  gem 'debugger'
end

# protect production passwords
gem 'bcdatabase'
