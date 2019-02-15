#takes a hash from the api_communicator.  this hash has a single drink and all its attributes
#adds this drink to the database and saves it to the drink variable
def add_drink(drink_hash)
  drink = Drink.create(name: drink_hash["strDrink"].strip.titleize.downcase, instructions: drink_hash["strInstructions"],
  vessel: drink_hash["strGlass"].strip.downcase, category: drink_hash["strCategory"].strip.downcase)
  drink_hash["strAlcoholic"] == "Alcoholic" ? drink.alcoholic = 1 : drink.alcoholic = 0
  drink.save
  create_ingredient_arrays(drink, drink_hash)
end

#takes the newly created drink and its hash as an argument
#ingredients are currently stored as attributes, as are quantities
#see test hash
#maps out ingredients and quantities.
#the ingredient position in the ingredients array will match the
#quantity position in the quantities array

def create_ingredient_arrays(drink, drink_hash)
  ingredients = drink_hash.map {|k, v| v if k.start_with?("strIngredient") && v != ""}.compact
  ingredients = ingredients.map { |element| element.strip.downcase }
  quantities = drink_hash.map {|k, v| v if k.start_with?("strMeasure") && v != ""}.compact
  quantities = quantities.map { |element| element.strip.downcase }
  add_ingredients_and_quantities(drink, drink_hash, ingredients, quantities)
end


#takes in the drink, drink_hash, ingredients array, and quantities array
#creates a new ingredient and shoves it onto drink.ingredients
#grabs the ingredient card for this instance of drink and ingredient
#adds the quantity for this ingredient card
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
