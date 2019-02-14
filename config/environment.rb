# require 'require_all'
# require_all '../app'
require 'bundler/setup'
require 'rest-client'
require 'json'
require 'sinatra/activerecord'
require_relative '../app/models/drink'
require_relative '../app/models/ingredient_card'
require_relative '../app/models/ingredient'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../db/update_db.rb"
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/cocktails.db"
)


#ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger = nil
