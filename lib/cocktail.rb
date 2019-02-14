
def learn_a_cocktail_intro
  puts "----------------------------------------------------------------"
  puts "Please the name of the cocktail you would like to learn to make:"
  puts "----------------------------------------------------------------"
  learn_a_cocktail
end

def learn_a_cocktail
  puts ""
  user_input = gets.strip.downcase.titleize.downcase
  if user_input == "exit"
    Use.exit_program
  else
    check_cocktail(user_input)
  end
end

def check_cocktail(user_input)
  if Drink.drink_exist(user_input) != nil
    print_cocktail(user_input)
    Use.run_again?
  else
    puts ""
    puts "----------------------------------------------------------------"
    puts "Sorry, that drink does not yet exist in our database."
    puts "Please the name of the cocktail you would like to learn to make:"
    puts "----------------------------------------------------------------"
    learn_a_cocktail
  end
end

def print_cocktail(user_input)
  drink = Drink.find_by(name: user_input)
  puts ""
  puts drink.name.upcase
  puts "--"
  puts ""
  puts drink.category.capitalize + " served in a " + drink.vessel
  puts "--"
  puts ""
  puts "Ingredients"
  puts "--"
  puts ""
  drink.ingredients.map do |ingredient|
    ingredient_card = IngredientCard.find_by(drink_id: drink.id, ingredient_id: ingredient.id)
    fixed_measure = ingredient_card.measurement && !ingredient_card.measurement.blank? ? ingredient_card.measurement + " - " : ""
    puts " • " + fixed_measure + ingredient_card.ingredient.name.titleize
  end
  puts ""
  puts "Instructions"
  puts "--"
  puts ""
  puts drink.instructions
  Use.run_again?
end
