require 'bundler/capistrano'
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


set :application, "euroexim"
set :repository,  "https://github.com/johnpollovictor/jseuro-selvam.git"
set :scm, :git

set :scm_username, '123'
set :scm_password, '123'
set :deploy_via, :copy
set :git_enable_submodules, 1 # if you have vendored rails
set :git_shallow_clone, 1
set :scm_verbose, true

set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false
set :rake, "#{rake} --trace"
def aws_staging name
	task name do
		yield    
		role :app, domain
		role :web, domain
		role :db, domain, :primary => true
		ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]
	end
end

aws_staging :ec2_staging do
	set :user, 'jseuroe2'  # Your dreamhost account's username
	set :domain, 'jseuroexim.com'  # Dreamhost servername where your account is located 
	set :application, 'euroexim'  # Your app's location (domain or sub-domain name as setup in panel)
	set :applicationdir, "/home3/#{user}/rails_apps/#{application}"  # The standard Dreamhost setup
	set :deploy_to, applicationdir
	set :branch, "master"  
	# set :default_environment, { 'PATH' => "/usr/lib64/ruby/gems/1.8/bin//bundle" }
end



namespace :deploy do
  after "deploy:update_code" do
   run "cp #{deploy_to}/shared/database.yml #{release_path}/config/database.yml"
   run "rm -f /home3/#{user}/public_html/euroexim"
   run "ln -s #{release_path}/public /home3/#{user}/public_html/euroexim"
   # run "cd /home3/#{user}/rails_apps/#{application}/current && bundle exec rake assets:precompile"
  end

	task :start do ; end
	task :stop do ; end

	task :restart, :roles => :app, :except => { :no_release => true } do
		run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
	end
end
