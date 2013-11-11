source 'http://rubygems.org'

gem 'rails'

# Bundle edge Rails instead:
# # gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

gem 'capistrano', '2.15.5'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
#group :development do 
#  gem 'linecache19', '0.5.13', :path => "~/.rvm/gems/ruby-1.9.3-p#{RUBY_PATCHLEVEL}@stuts/gems/linecache19-0.5.13/"
#  gem 'ruby-debug-base19', '0.11.26', :path => "~/.rvm/gems/ruby-1.9.3-p#{RUBY_PATCHLEVEL}@stuts/gems/ruby-debug-base19-0.11.26/"
#  gem 'ruby-debug19', :require => 'ruby-debug'
#end

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end
gem "browsercms", "3.5.6"

group :production do
  gem 'uglifier'
  gem 'therubyracer'
end

# protect production passwords
gem 'bcdatabase'
