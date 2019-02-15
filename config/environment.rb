# require 'require_all'
# require_all '../app'
require 'bundler/setup'
require 'rest-client'
require 'json'
require 'sinatra/activerecord'
require 'rails'
require_relative '../app/models/drink'
require_relative '../app/models/ingredient_card'
require_relative '../app/models/ingredient'
require_relative "../lib/api_communicator.rb"
require_relative "../db/update_db.rb"
require_relative "../lib/banner.rb"
require_relative "../lib/by_ingredient.rb"
require_relative "../lib/cocktail.rb"
require_relative "../lib/info.rb"
require_relative "../lib/use.rb"
require_relative "../lib/variety.rb"
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/cocktails.db"
)


#ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger = nil
SINATRA_ACTIVESUPPORT_WARNING=false
