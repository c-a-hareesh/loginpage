# config valid for current version and patch releases of Capistrano
#lock "~> 3.11.2"

#set :application, "loginpage"
#set :repo_url, "git@github.com:c-a-hareesh/loginpage.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5


# config valid only for current version of Capistrano
lock '3.11.2'

# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :application, "loginpage"
set :repo_url, "git@github.com:c-a-hareesh/loginpage.git"

# Deploy to the user's home directory
set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Only keep the last 5 releases to save disk space
set :keep_releases, 5

# Optionally, you can symlink your database.yml and/or secrets.yml file from the shared directory during deploy
# This is useful if you don't want to use ENV variables
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

namespace :deploy do
 before 'check:linked_files', 'config:push'
 # before 'check:linked_files', 'puma:config'
 # before 'check:linked_files', 'puma:nginx_config'
 # before 'deploy:migrate', 'deploy:db:create'
 # after 'puma:smart_restart', 'nginx:restart'
end
