# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'rhino'
set :repo_url, 'git@github.com:dev-kitchen/rhino.git'
set :deploy_to, '/srv/www/rhino.dev.kitchen'

set :linked_files, -> { %W{} }
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/assets public/system}

set :keep_releases, 5

set :rbenv_type, :system
set :rbenv_ruby, '2.3.0'

namespace :deploy do
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
end

after 'deploy:publishing', 'deploy:restart'
