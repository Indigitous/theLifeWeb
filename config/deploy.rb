require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "theLife"
set :repository,  "git@github.com:ballistiq/theLifeWeb.git"

set :stages, %w(staging production)
set :default_stage, "staging"
set :deploy_via, :remote_cache
set :keep_releases, 5
set :scm, :git

# Automatic asset precompilation locally
after   'deploy:update_code', 'deploy:assets:precompile'
before  'deploy:finalize_update', 'deploy:assets:symlink'

# Create database symlink
after   'deploy:update_code', 'db:create_symlink'

# After restarting Passenger, cleanup
after   'deploy:restart', 'deploy:cleanup'

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end