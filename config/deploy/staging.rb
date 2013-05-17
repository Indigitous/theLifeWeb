set :dns_name, "dev.ballistiq.com"

role :web, dns_name                          # Your HTTP server, Apache/etc
role :app, dns_name                          # This may be the same as your `Web` server
role :db,  dns_name, primary: true           # This is where Rails migrations will run

set :deploy_to, "/home/ubuntu/webprojects/theLifeWeb"

set :rails_env, 'staging'
set :branch, 'master'
set :use_sudo, false

set :user, 'ubuntu'
set :port, 22
set :db_username, 'root'