ssh_options[:paranoid] = false 
set :application, "natalsemfome.org"
set :repository,  "git@github.com:rafarubert/aluguelbom.git"
set :scm_verbose, true
set :user, "railsapps"
set :domain, "68.233.11.26"
set :remote, :user
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"
set :scm, :git   
role :web, domain
role :app, domain
role :db, domain
    

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
=begin
#-- github
#ssh_options[:port] = 22223
set :scm, "git"
set :scm_user, 'rafarubert'
set :repository,  "git@github.com:rafarubert/aluguelbom.git"
set :scm_passphrase, "rafaellen" #This is your custom users password
set :scm_verbose, true
set :remote, 'rafarubert'
set :rails_env, "production" 
ssh_options[:forward_agent] = true
set :branch, "master"
set :user, "railsapps" # usuario do servidor
set :remote, 'railsapps'
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
#set :use_sudo, false # nao usar sudo
set :domain, "68.233.11.26"  #dominio onde sera enviado os arquivos
set :application, "aluguelbom.com.br"  #meu aplicativo
set :deploy_to, "/home/#{user}/#{application}"
set :copy_exclude, %w(.git/* .svn/* log/* tmp/* .gitignore)
set :keep_releases, 5
role :web, domain
role :app, domain
role :db, domain
ssh_options[:username] = user
ssh_options[:paranoid] = false
default_run_options[:pty] = true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
#  task :criando_link_simbolico do
#    run "rm -rf ~/aluguelbom.com.br"
#    run "ln -nfs ~/rails_apps/#{application}/public/ ~/public_html/aluguelbom"
#  end
end


#set :application, "set your application name here"
#set :repository,  "set your repository location here"

#set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
=end
