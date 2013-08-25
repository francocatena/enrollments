require 'bundler/capistrano'
require 'sidekiq/capistrano'

set :application, 'enrollments'
set :repository, 'https://github.com/francocatena/enrollments'

set :scm, :git
set :branch, 'master'

set :user, 'deployer'
set :group_writable, false
set :use_sudo, false
set :deploy_to, '/var/rails/enrollments'
set :shared_children, %w(log)

role :web, '192.241.250.69'
role :app, '192.241.250.69'
role :db,  '192.241.250.69', primary: true

# For Rbenv
set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

before 'deploy:finalize_update', 'deploy:create_shared_symlinks'
after 'deploy:update_code', 'deploy:create_tmp_pids_symlink'
after 'deploy:restart', 'deploy:cleanup'

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  task :restart, roles: :app, except: { no_release: true } do
    run "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end

  desc 'Creates the symlinks for the shared folders'
  task :create_shared_symlinks, roles: :app, except: { no_release: true } do
    shared_paths = [['config', 'app_config.yml'], ['db', 'production.sqlite3']]

    shared_paths.each do |path|
      shared_files_path = File.join(shared_path, *path)
      release_files_path = File.join(release_path, *path)

      run "ln -s #{shared_files_path} #{release_files_path}"
    end
  end

  desc 'Creates the synmlink to tmp/pids'
  task :create_tmp_pids_symlink, roles: :app, except: { no_release: true } do
    run "mkdir -p #{release_path}/tmp"
    run "mkdir -p #{shared_path}/tmp/pids"
    run "ln -s #{shared_path}/tmp/pids #{release_path}/tmp/pids"
  end
end
