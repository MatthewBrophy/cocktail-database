

def add_drink(drink_hash)
  drink = Drink.create(name: drink_hash["strDrink"].strip, instructions: drink_hash["strInstructions"],
  vessel: drink_hash["strGlass"], category: drink_hash["strCategory"])
  drink_hash["strAlcoholic"] == "Alcoholic" ? drink.alcoholic = 1 : drink.alcoholic = 0
  drink.save
  create_ingredient_arrays(drink, drink_hash)
end

def create_ingredient_arrays(drink, drink_hash)
  ingredients = drink_hash.map {|k, v| v if k.start_with?("strIngredient") && v != ""}.compact
  ingredients = ingredients.map { |element| element.strip }
  quantities = drink_hash.map {|k, v| v if k.start_with?("strMeasure") && v != ""}.compact
  quantities = quantities.map { |element| element.strip }
  add_ingredients_and_quantities(drink, drink_hash, ingredients, quantities)
end

def add_ingredients_and_quantities(drink, drink_hash, ingredients, quantities)
  i = 0
  while i < ingredients.length
    ingredient = Ingredient.find_or_create_by(name: ingredients[i])
    drink.ingredients << ingredient
    add_description_to_ingredient(ingredient)
    ingredient_card = IngredientCard.find_by(drink_id: drink.id, ingredient_id: ingredient.id)
    ingredient_card.measurement = quantities[i]
    ingredient_card.save
    i += 1
  end
end

def add_description_to_ingredient(ingredient)
  description_to_add = find_description(ingredient.name)
    ingredient.description = description_to_add
    ingredient.save
end

# User.find_or_create_by(first_name: 'Scarlett') do |user|
#   user.last_name = 'Johansson'
# end



# ingredients.each do |ingredient_name|
#   ingredient = Ingredient.find_or_create_by_name(ingredient_name)
#   drink.ingredients << ingredient
# end
