require 'capistrano-deploy'
use_recipes :git, :bundle, :rails

server '198.211.116.131', :web, :app, :db, primary: true
set :user, 'flexoid'
set :deploy_to, '~/web/github-badge'
set :repository, 'git@github.com:flexoid/github-badge.git'
set :ssh_options, { forward_agent: true }

after 'deploy:update', 'bundle:install'
