require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

# desc 'make a fresh database'
# task :fresh do
#   Rake::Task["db:reset"].invoke
#   # Rake::Task["db:migrate"].invoke
#   # Rake::Task["db:seed"].invoke
# end

# desc 'fresh database'
# task reseed: [ 'db:drop', 'db:create', 'db:migrate', 'db:seed' ]

