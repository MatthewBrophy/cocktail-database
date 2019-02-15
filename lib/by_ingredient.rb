class ByIngredient

  def self.lookup_drink_list_intro
    puts ""
    puts "---------------------------------------------------------------------------------"
    puts "Please enter the name of an Ingredient:"
    puts "---------------------------------------------------------------------------------"
    ByIngredient.lookup_drink_list_input
  end

  def self.lookup_drink_list_input
    puts ""
    user_input = gets.strip.downcase.titleize.downcase
    if user_input == "exit"
      Use.exit_program
    elsif Ingredient.ingredient_exist(user_input) != nil
      drinks_array = Ingredient.drink_list(user_input)
      puts ""
      puts "---------------------------------------------------------------------------------"
      puts "Choose yo drank:            (Enter a number between 1 and #{drinks_array.length})"
      puts "---------------------------------------------------------------------------------"
      drinks_array.each_with_index do |drink, index|
        puts "#{index + 1}. #{drink.name.titleize}  (#{drink.difficulty.titleize})"
      end
      puts "---------------------------------------------------------------------------------"
      ByIngredient.lookup_drink_list(drinks_array)
    else
      puts ""
      puts "----------------------------------------------------------"
      puts "Sorry, that ingredient does not yet exist in our database."
      puts "Please enter another ingredient"
      puts "----------------------------------------------------------"
      ByIngredient.lookup_drink_list_input
    end
  end

  def self.lookup_drink_list(drinks_array)
    puts ""
    user_input = gets.strip.downcase.titleize.downcase
    if user_input == "exit"
      Use.exit_program
    else
      user_input = user_input.downcase.to_i
      if user_input.between?(1, (drinks_array.length))
        Cocktail.print_cocktail(drinks_array[(user_input - 1)].name.downcase)
        Use.run_again?
      else
        puts ""
        puts "-------------------------------------"
        puts "Somebody didn't learn to count to #{drinks_array.length}"
        puts "Please enter a number between 1 and #{drinks_array.length}"
        puts "-------------------------------------"
        ByIngredient.lookup_drink_list(drinks_array)
      end
    end
  end
end
