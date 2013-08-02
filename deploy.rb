require "bundler/capistrano"

#gem 'capistrano-maintenance'
#require 'capistrano/maintenance'
#
#
##cap deploy:web:disable
##cap deploy:web:enable
## use local template instead of included one with capistrano-maintenance
#set :maintenance_template_path, 'app/views/maintenance.html.erb'

#this loads up all the server build recipes

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"
load "config/recipes/assets"

server "my.server.com", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "myapp"
set :deploy_to, "/home/#{user}/apps/#{application}"
#set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:YOUR_ACCOUNT/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases




















