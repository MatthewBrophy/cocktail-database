require 'rest-client'
require 'json'
require 'pry'
require_relative "../db/seeds.rb"

def api_communicator_test
  puts "api test pass"
end

def all_ingredients
  ingredient_list = JSON.parse(RestClient.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'))
  ingredient_list["drinks"].map do |item|
    item["strIngredient1"].split(" ").join('_').split("ñ").join('n').split("ä").join('a')
  end
end

def get_all_drinks_from_ingredient_list
  all_drinks = []
  all_ingredients.each do |ingredient|
    drinks = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"))
    drinks["drinks"].each do |drink|
      all_drinks << drink["idDrink"]
    end
  end
  all_drinks.uniq
end

def populate_database
  #drink_hash = {}
  get_all_drinks_from_ingredient_list.each do |id|
    drink_hash = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}"))
    add_drink(drink_hash["drinks"][0])
  end
end
