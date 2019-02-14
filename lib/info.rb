
def describe_ingredient_intro
  puts "---------------------------------"
  puts "Enter the name of your ingredient"
  puts "---------------------------------"
  describe_ingredient
end

def describe_ingredient
  puts ""
  user_input = gets.strip.downcase.titleize.downcase
  if user_input == "exit"
    Use.exit_program
  else
    if Ingredient.ingredient_exist(user_input) != nil
      ingredient = Ingredient.find_by(name: user_input)
      puts ""
      puts ingredient.name.titleize
      puts "-----"
      puts ""
      puts ingredient.description
      puts ""
      Use.run_again?
    else
      puts ""
      puts "Sorry, that ingredient does not yet exist in our database."
      describe_ingredient
    end
  end
end
