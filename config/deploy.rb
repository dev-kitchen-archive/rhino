# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'rhino'
set :repo_url, 'git@github.com:dev-kitchen/rhino.git'
set :deploy_to, '/srv/www/rhino.dev.kitchen'

set :linked_files, -> { %W{config/database.yml} }
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads public/assets}

set :keep_releases, 5

set :rbenv_type, :system
set :rbenv_ruby, '2.3.0'

task :notify_rollbar do
  on roles(:app) do |h|
    revision = `git log -n 1 --pretty=format:"%H"`
    local_user = `whoami`
    rollbar_token = 'af19256cca0440569f666a4d97475097'
    rails_env = fetch(:rails_env, 'production')
    execute "curl -s -o /dev/null https://api.rollbar.com/api/1/deploy/ -F access_token=#{rollbar_token} -F environment=#{rails_env} -F revision=#{revision} -F local_username=#{local_user}", :once => true
  end
end

namespace :deploy do
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
end

after 'deploy:publishing', 'deploy:restart'
after 'deploy:restart', 'notify_rollbar'
