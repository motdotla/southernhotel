# =============================================================================
# ROLES
# =============================================================================
role :app, "174.142.75.247"
role :web, "174.142.75.247"
role :db,  "174.142.75.247", :primary => true

# =============================================================================
# SETUP
# =============================================================================
set :user, 'scottmotte'
set :application, "southernhotel.org"
 
# =============================================================================
# DEPLOY TO
# =============================================================================
set :deploy_to, "/home/scottmotte/apps/southernhotel.org"
set :scm_verbose, true
set :use_sudo, false

# # =============================================================================
# # REPOSITORY
# # =============================================================================
set :scm, "git"
set :repository,  "git@github.com:scottmotte/southernhotel.org.git"
set :branch, "master"
set :deploy_via, :remote_cache

# =============================================================================
# SSH OPTIONS
# =============================================================================
default_run_options[:pty] = true
ssh_options[:paranoid] = false
 
# =============================================================================
# RAKE TASKS & OTHER SERVER TASKS
# =============================================================================
namespace :deploy do
  # override Rails related callbacks
  task :finalize_update do
  end
 
  task :migrate do
  end
  
  desc 'restart app'
  task :restart do
  end
  
  desc "Create symlink to public_html/southernhotel.org/public"
  task :symlinkify do
    run "rm -rf /home/scottmotte/public_html/southernhotel.org/public; ln -s #{current_path}/output/ /home/scottmotte/public_html/southernhotel.org/public"
  end
end
 
after "deploy", "deploy:cleanup", "deploy:symlinkify"