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

def get_drink_hash_by_id
  all_drinks = {}
  get_all_drinks_from_ingredient_list.each do |id|
    drink_hash = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}"))
    name = drink_hash["drinks"][0]["strDrink"]
    category = drink_hash["drinks"][0]["strCategory"]
    alcoholic = drink_hash["drinks"][0]["strAlcoholic"]
    glass = drink_hash["drinks"][0]["strGlass"]
    instructions = drink_hash["drinks"][0]["strInstructions"]
    ingredient1 = drink_hash["drinks"][0]["strIngredient1"]
    ingredient2 = drink_hash["drinks"][0]["strIngredient2"]
    ingredient3 = drink_hash["drinks"][0]["strIngredient3"]
    ingredient4 = drink_hash["drinks"][0]["strIngredient4"]
    ingredient5 = drink_hash["drinks"][0]["strIngredient5"]
    ingredient6 = drink_hash["drinks"][0]["strIngredient6"]
    ingredient7 = drink_hash["drinks"][0]["strIngredient7"]
    ingredient8 = drink_hash["drinks"][0]["strIngredient8"]
    ingredient9 = drink_hash["drinks"][0]["strIngredient9"]
    ingredient10 = drink_hash["drinks"][0]["strIngredient10"]
    measure1 = drink_hash["drinks"][0]["strMeasure1"]
    measure2 = drink_hash["drinks"][0]["strMeasure2"]
    measure3 = drink_hash["drinks"][0]["strMeasure3"]
    measure4 = drink_hash["drinks"][0]["strMeasure4"]
    measure5 = drink_hash["drinks"][0]["strMeasure5"]
    measure6 = drink_hash["drinks"][0]["strMeasure6"]
    measure7 = drink_hash["drinks"][0]["strMeasure7"]
    measure8 = drink_hash["drinks"][0]["strMeasure8"]
    measure9 = drink_hash["drinks"][0]["strMeasure9"]
    measure10 = drink_hash["drinks"][0]["strMeasure10"]
    all_drinks[name] = {category: category, alcoholic: alcoholic, glass: glass, instructions: instructions, ingredients: {"#{ingredient1}": measure1, "#{ingredient2}": measure2, "#{ingredient3}": measure3, "#{ingredient4}": measure4, "#{ingredient5}": measure5, "#{ingredient6}": measure6, "#{ingredient7}": measure7, "#{ingredient8}": measure8, "#{ingredient9}": measure9, "#{ingredient10}": measure10}}
  end
  binding.pry
end
