#!/usr/bin/env ruby
# require_relative "../lib/api_communicator.rb"
# require_relative "../lib/command_line_interface.rb"
# require_relative "../db/seeds.rb"
# require_relative '../app/models/drink'
# require_relative '../app/models/ingredient_card'
# require_relative '../app/models/ingredient'

require_relative '../config/environment'
require 'pry'
require 'pp'
require_relative "../app/models/drink.rb"


puts Drink
puts IngredientCard
puts Ingredient

api_communicator_test
welcome

Pry.start

.