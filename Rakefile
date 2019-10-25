require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

desc 'make a fresh database'
task :refresh do
  5.times do
  Rake::Task["db:rollback"]
  end
begin
  f = File.open('db/development.db', 'r')
ensure
  f.close unless f.nil? or f.closed?
  File.delete('db/development.db') if File.exists? 'db/development.db'
end
begin
  f = File.open('db/schema.rb', 'r')
ensure
  f.close unless f.nil? or f.closed?
  File.delete('db/schema.rb') if File.exists? 'db/schema.rb'
end
Rake::Task["db:migrate"].invoke
Rake::Task["db:seed"].invoke
end

# desc 'fresh database'
# task reseed: [ 'db:drop', 'db:create', 'db:migrate', 'db:seed' ]

