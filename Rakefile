require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

desc 'migrate and seed db'
task :start do
  Rake::Task["db:migrate"].invoke
  Rake::Task["db:seed"].invoke
end