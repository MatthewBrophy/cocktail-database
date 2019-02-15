
def describe_ingredient_intro
  puts ""
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
      Banner.divider
      Banner.ingredient_banner
      puts ""
      puts ingredient.name.upcase
      puts "--"
      puts ""
      if ingredient.description.blank?
        puts "Sorry, a description has not yet been writted for this ingredient"
      else
        puts ingredient.description
      end
      Use.run_again?
    else
      puts ""
      puts "----------------------------------------------------------"
      puts "Sorry, that ingredient does not yet exist in our database."
      puts "Enter the name of your ingredient"
      puts "----------------------------------------------------------"
      describe_ingredient
    end
  end
end
