require 'rest-client'
require 'json'
require 'pry'

def get_drinks_from_ingredient(ingredient)
  drink_hash = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"))
  drink_names = {}
  drink_hash["drinks"].map do |drink|
    
  end
end

def all_ingredients
  ingredient_list = JSON.parse(RestClient.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'))
  ingredient_list["drinks"].map do |item|
    item["strIngredient1"].split(" ").join('_')
    item["strIngredient1"].split("ñ").join('n')
  end
end

def get_all_drinks_from_ingredient_list
  all_ingredients.map do |ingredient|
    puts ingredient
    # begin
    #   JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"))
    # rescue
    #   puts "ERRORED OUT ON: " + ingredient
    # end
  end
  # JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Light_Rum"))
end