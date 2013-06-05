set :dns_name, "srv1.thelifeapp.com"

role :web, dns_name                          # Your HTTP server, Apache/etc
role :app, dns_name                          # This may be the same as your `Web` server
role :db,  dns_name, primary: true           # This is where Rails migrations will run

set :deploy_to, "/var/www/html/theLifeWeb"

set :rails_env, 'production'
set :branch, 'master'
set :use_sudo, false

set :user, 'clarence'
set :port, 22
set :db_username, 'root'