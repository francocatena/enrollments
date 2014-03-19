set :stage, :production
set :rails_env, 'production'

role :web, %w{deployer@quieroruby.com.ar}
role :app, %w{deployer@quieroruby.com.ar}
role :db,  %w{deployer@quieroruby.com.ar}

server 'quieroruby.com.ar', user: 'deployer', roles: %w{web app db}
