source 'http://rubygems.org'

gem 'rails', '3.1.4'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

gem 'tidy_ffi', git:'https://github.com/libc/tidy_ffi', ref:"db85e" # need edge version!
gem 'rack-tidy-ffi'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
group :development do 
  gem 'linecache19', '0.5.13', :path => "~/.rvm/gems/ruby-1.9.3-p#{RUBY_PATCHLEVEL}@stuts/gems/linecache19-0.5.13/"
  gem 'ruby-debug-base19', '0.11.26', :path => "~/.rvm/gems/ruby-1.9.3-p#{RUBY_PATCHLEVEL}@stuts/gems/ruby-debug-base19-0.11.26/"
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end
gem "browsercms", "3.4.2.rc1"
