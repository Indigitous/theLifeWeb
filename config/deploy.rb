require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "theLife"
set :repository,  "git@github.com:PowerToChange/theLifeWeb.git"

set :stages, %w(staging production)
set :default_stage, "staging"
set :deploy_via, :remote_cache
set :keep_releases, 5
set :scm, :git

# Automatic asset precompilation locally
after   'deploy:update_code', 'deploy:assets:precompile'
before  'deploy:finalize_update', 'deploy:assets:symlink'

# Link uploads and statics
before  'deploy:finalize_update', 'uploads:symlink'
before  'deploy:finalize_update', 'statics:symlink'

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

# Upload path
namespace :uploads do
  task :create_uploads_folder do
    run "mkdir -p #{shared_path}/uploads"
  end

  task :symlink do
    create_uploads_folder
    run "ln -s #{shared_path}/uploads #{latest_release}/uploads"
  end
end

# static images path
namespace :statics do
  task :create_statics_folder do
    run "mkdir -p #{shared_path}/static"
  end

  task :symlink do
    create_statics_folder
    run "ln -s #{shared_path}/static #{latest_release}/public/static"
  end
end