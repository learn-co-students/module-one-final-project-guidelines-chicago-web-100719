require 'bundler'
Bundler.require
require 'tty'
require 'tty-table'
require 'colorize'
require 'tty-prompt'
require 'pry'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil
require_all 'lib'
