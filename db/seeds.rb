
def add_drink(drink_hash)
  drink = Drink.create(name: drink_hash["strDrink"], instructions: drink_hash["strInstructions"],
  vessel: drink_hash["strGlass"], category: drink_hash["strCategory"])
  #How do I set a boolean equal to true or false on active record.
  #drink_hash["strAlcoholic"] == "Alcoholic" ? drink.alcoholic = 1 : drink.alcoholic = 0
  add_ingredients(drink, drink_hash)

end

def add_ingredients(drink, drink_hash)
  #binding.pry
  ingredients = drink_hash.map {|k, v| v if k.start_with?("strIngredient") && v != ""}.compact
  quantities = drink_hash.map {|k, v| v if k.start_with?("strMeasure") && v != ""}.compact
  i = 0
  while i < ingredients.length
    ingredient = Ingredient.find_or_create_by(name: ingredients[i])
    binding.pry
    drink.ingredients << ingredient
    ingredient_card = IngredientCard.find_by(drink_id: drink.id, ingredient_id: ingredient.id)
    ingredient_card.quantity = quantities[i]
    i += 1
  end
end

# User.find_or_create_by(first_name: 'Scarlett') do |user|
#   user.last_name = 'Johansson'
# end



# ingredients.each do |ingredient_name|
#   ingredient = Ingredient.find_or_create_by_name(ingredient_name)
#   drink.ingredients << ingredient
# end
