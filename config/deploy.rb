require 'bundler/capistrano'
require 'fileutils'
require 'capistrano-rbenv'

set :application, "stuts-cms"
set :repository,  "https://github.com/Fryie/stuts-cms"
server "141.84.137.37", :app, :web, :db, :primary => true, port: 800

set :scm, :git
set :deploy_to, "/var/www/stuts"
set :user, "deploy"
set :branch, "master"
set :use_sudo, false
set :rbenv_ruby_version, '2.1.8'
set :rbenv_path, '/usr/local/rbenv'

default_run_options[:pty] = true

set :deploy_via, :remote_cache

MAIN_SERVER = '141.84.137.37'

task :link_shared_directories do
  run "ln -s #{shared_path}/uploads #{release_path}/uploads"
end

task :set_permissions do
  run "chgrp -R www-data #{release_path}/public"
end

after "deploy:update_code", :link_shared_directories
after "deploy:update_code", :set_permissions

namespace :data do
  require 'yaml'
  set :sql_dump_file, "dump.#{application}.sql"

  desc <<-DESC
    Get production data and load it into development. A new copy of the
    production database and production public/assets are cached and
    loaded into the development environment.
  DESC
  task :load_from_prod do
    cache_prod_data
    load_from_cache
  end

  desc <<-DESC
    Get production and cache it locally. The production database and 
    production public/assets directory are downloaded and cached.
  DESC
  task :cache_prod_data, :roles => :db, :only => { :primary => true } do
    on_rollback { run "rm #{current_path}/tmp/#{sql_dump_file}" }

    require 'yaml'

    database_yml = capture "erb #{current_path}/config/database.yml"
    config = YAML::load(database_yml)['production']

    run "mysqldump #{mysql_options(config, true)}"+
      " > #{current_path}/tmp/#{sql_dump_file}" do |ch, _, out| 
      if out =~ /^Enter password: /
        ch.send_data "#{config['password']}\n"
      else
        puts out 
      end
    end

    FileUtils.mkdir_p("tmp/data/public/assets")

    logger.debug "rsyncing #{sql_dump_file} from #{application}"
    system "rsync -lrp "+
      "#{user}@#{MAIN_SERVER}:#{current_path}/tmp/#{sql_dump_file} tmp/data"
    run "rm #{current_path}/tmp/#{sql_dump_file}"

    logger.debug "rsyncing assets from #{application}"
    system "rsync -lrp --delete "+
      "#{user}@#{MAIN_SERVER}:#{shared_path}/assets tmp/data/public"
  end

  desc <<-DESC
    (Re)load cached production data into development. Use
    data:cache_prod_data or data:load_from_prod to create the cache.
  DESC
  task :load_from_cache do
    config = YAML.load(ERB.new(File.read('config/database.yml')).result)['development']
    if File.exist?("tmp/data/#{sql_dump_file}") 
      mysql_load = "mysql #{mysql_options(config)} < tmp/data/#{sql_dump_file}"
      logger.debug %(executing "#{mysql_load.sub(/-p\S+/, '-px')}")
      system mysql_load 
      FileUtils.rm_rf("public/assets/*")
      FileUtils.cp_r("tmp/data/public/assets", "public")
    else
      abort "The data cache is empty, try 'cap data:load_from_prod'"
    end
  end

  # Return MySQL options for a specific configuration.
  def mysql_options(config, prompt_for_password=false)
    if config['password'] 
      password_opt = prompt_for_password ? " -p" : " -p #{config['password']}"
    else
      password_opt = ""
    end
    "-u #{config['username']} #{config['database']}"+
      password_opt
  end

end
