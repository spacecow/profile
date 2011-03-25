default_run_options[:pty] = true
set :repository,  "git@github.com:spacecow/profile.git"
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache
set :use_sudo, false

set :application, "profile"
set :deploy_to, "/export/home/deploy/apps/#{application}"
set :user, "deploy"
set :admin_runner, "deploy"
  
role :app, "habu.firsec.riec.tohoku.ac.jp"
role :web, "habu.firsec.riec.tohoku.ac.jp"
role :db,  "habu.firsec.riec.tohoku.ac.jp", :primary => true

# set :rake, "/usr/local/bin/rake"
set :default_environment, { 
  'PATH' => "/usr/bin:/usr/sbin:/usr/ccs/bin:/usr/sfw/bin:/usr/local/bin:/opt/sfw/bin" }
#   'RUBY_VERSION' => 'ruby 1.9.2',
#   'GEM_HOME' => '/usr/local/bin/',
#   'GEM_PATH' => '/usr/local/bin/'
# }


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
