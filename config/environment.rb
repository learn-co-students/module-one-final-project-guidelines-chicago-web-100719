require 'bundler'
Bundler.require
require 'tty'
require 'tty-table'
require 'rake'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil
require_all 'lib'

rake console
