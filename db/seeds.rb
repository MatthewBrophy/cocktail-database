def add_drink(drink_hash)
  drink = Drink.create(name: drink_hash["strDrink"], instructions: drink_hash["strInstructions"],
  vessel: "strGlass", category: "strCategory", api_id: "idDrink")
  drink_hash["strAlcoholic"] == "Alcoholic" ? drink.alcoholic = true : drink.alcoholic = false
  add_ingredients(drink, drink_hash)
end

def add_ingredients(drink, drink_hash)
  ingredients = drink_hash.map {|k, v| v if k.start_with?("strIngredient")}
  ingredients.each do |ingredient|
    Ingredient.find_or_create_by_name(ingredient)
  end
end