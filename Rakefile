# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "Setup the build tools environment"
task :setup do
  puts "* Installing Build Tools"
  sh "bundle install"
end

task :default do
  # Check the build Environment
  `bundle check > /dev/null`
  if $?.exitstatus != 0
    sh "rake setup"
  end

  sh "rake cloud9"
end

desc "Run server on Cloud9"
task :cloud9 do
  puts "Open: http://olympic2016-honghaoz.c9users.io"
  sh "rails server -b $IP -p $PORT"
end
