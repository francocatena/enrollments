require 'bundler/capistrano'
require 'sidekiq/capistrano'

set :application, 'enrollments'
set :repository, 'https://github.com/francocatena/enrollments'

set :scm, :git
set :branch, 'master'

set :deploy_to, '/var/rails/libreduca'

role :web, 'quieroruby.com.ar'
role :app, 'quieroruby.com.ar'
role :db,  'quieroruby.com.ar', primary: true

after 'deploy:restart', 'deploy:cleanup'

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, roles: :app, except: { no_release: true } do
    run "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end
