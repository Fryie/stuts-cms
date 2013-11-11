require 'bundler/capistrano'

set :application, "stuts-cms"
set :repository,  "git@github.com:Fryie/stuts-cms"
server "jwmail.de", :app, :web, :db, :primary => true

set :scm, :git
set :deploy_to, "/var/www/web4/html/stuts-cms"
set :user, "piru"
set :branch, "master"

default_run_options[:pty] = true

set :deploy_via, :remote_cache
