

def add_drink(drink_hash)
  drink = Drink.create(name: drink_hash["strDrink"], instructions: drink_hash["strInstructions"],
  vessel: drink_hash["strGlass"], category: drink_hash["strCategory"], api_id: drink_hash["idDrink"])
  drink_hash["strAlcoholic"] == "Alcoholic" ? drink.alcoholic = true : drink.alcoholic = false
  add_ingredients(drink, drink_hash)
end

def add_ingredients(drink, drink_hash)
  ingredients = drink_hash.map {|k, v| v if k.start_with?("strIngredient")}
  while i < ingredients.length
    ingredient = Ingriedent.find_or_create_by_name(ingredients[i])
    drink.ingredients << ingredient
    IngredientCard.create(drink, ingredient)
  end
end

# ingredients.each do |ingredient_name|
#   ingredient = Ingredient.find_or_create_by_name(ingredient_name)
#   drink.ingredients << ingredient
# end
