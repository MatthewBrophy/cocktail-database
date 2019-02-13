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

populate_database

# test_hash = {"idDrink"=>"14588",
#     "strDrink"=>"151 Florida Bushwacker    ",
#     "strDrinkES"=>nil,
#     "strDrinkDE"=>nil,
#     "strDrinkFR"=>nil,
#     "strDrinkZH-HANS"=>nil,
#     "strDrinkZH-HANT"=>nil,
#     "strVideo"=>nil,
#     "strCategory"=>"Milk / Float / Shake",
#     "strIBA"=>nil,
#     "strAlcoholic"=>"Alcoholic",
#     "strGlass"=>"Beer mug",
#     "strInstructions"=>"Combine all ingredients. Blend until smooth. Garnish with chocolate shavings if desired.",
#     "strInstructionsES"=>nil,
#     "strInstructionsDE"=>nil,
#     "strInstructionsFR"=>nil,
#     "strInstructionsZH-HANS"=>nil,
#     "strInstructionsZH-HANT"=>nil,
#     "strDrinkThumb"=>"https://www.thecocktaildb.com/images/media/drink/rvwrvv1468877323.jpg",
#     "strIngredient1"=>"Malibu rum",
#     "strIngredient2"=>"Light rum",
#     "strIngredient3"=>"151 proof rum",
#     "strIngredient4"=>"Dark Creme de Cacao",
#     "strIngredient5"=>"Cointreau",
#     "strIngredient6"=>"Milk",
#     "strIngredient7"=>"Coconut liqueur",
#     "strIngredient8"=>"Vanilla ice-cream",
#     "strIngredient9"=>"Creme De Mure",
#     "strIngredient10"=>"",
#     "strIngredient11"=>"",
#     "strIngredient12"=>"",
#     "strIngredient13"=>"",
#     "strIngredient14"=>"",
#     "strIngredient15"=>"",
#     "strMeasure1"=>"1/2 oz ",
#     "strMeasure2"=>"1/2 oz ",
#     "strMeasure3"=>"1/2 oz Bacardi",
#     "strMeasure4"=>"1 oz ",
#     "strMeasure5"=>"1 oz ",
#     "strMeasure6"=>"3 oz ",
#     "strMeasure7"=>"1 oz ",
#     "strMeasure8"=>"1 cup ",
#     "strMeasure9"=>"2",
#     "strMeasure10"=>" ",
#     "strMeasure11"=>" ",
#     "strMeasure12"=>" ",
#     "strMeasure13"=>" ",
#     "strMeasure14"=>"",
#     "strMeasure15"=>"",
#     "dateModified"=>"2016-07-18 22:28:43"}
#
# add_drink(test_hash)



#Pry.start
