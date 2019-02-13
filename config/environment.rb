require 'bundler/setup'
require "sinatra/activerecord"
require 'rest-client'
require 'json'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/cocktails.db"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'app'

