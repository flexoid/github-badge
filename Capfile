require 'capistrano-deploy'
use_recipes :git, :bundle, :thin

server '198.211.116.131', :web, :app, :db, primary: true
set :user, 'flexoid'
set :deploy_to, '~/web/github-badge'
set :repository, 'git@github.com:flexoid/github-badge.git'
set :ssh_options, { forward_agent: true }

set :default_environment, {
  'PATH'          => '/home/flexoid/.rbenv/shims:/usr/local/rbenv/bin:$PATH',
  'RBENV_ROOT'    => '/home/flexoid/.rbenv',
  'RBENV_VERSION' => '2.0.0-p247'
}

set :thin_params, '-d -S tmp/sockets/thin.sock'

after 'deploy:update', 'bundle:install'
after 'deploy:restart', 'thin:restart'
