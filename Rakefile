require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

desc 'migrates, seeds, and starts app'
task :start_up do
  if !Player.all
    puts "Bundling..."
    "bundle install"
    puts "Migrating..."
    Rake::Task['db:migrate'].invoke
    puts "Seeding..."
    Rake::Task['db:seed'].invoke
  end
  ruby "bin/run.rb"
end
