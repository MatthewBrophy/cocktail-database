class ByIngredient

#prints intro to ingredient prompt
  def self.lookup_drink_list_intro
    puts ""
    puts "---------------------------------------------------------------------------------"
    puts "Please enter the name of an Ingredient:"
    puts "---------------------------------------------------------------------------------"
  end

#master run file for this class
  def self.lookup_drink_list
    drinks_array = ByIngredient.find_drink_list
    if drinks_array.length == 1
      return ByIngredient.choose_drink(drinks_array)
    end
    puts ""
    puts "---------------------------------------------"
    ByIngredient.display_array(drinks_array)
    puts "---------------------------------------------"
    ByIngredient.another_ingredient_check_intro
    drink_more = ByIngredient.another_ingredient_check
    while drink_more == true
      ByIngredient.lookup_drink_list_intro
      another_drink_array = ByIngredient.find_drink_list
      drinks_array = drinks_array & another_drink_array
      if drinks_array.length > 1
        puts ""
        puts "---------------------------------------------"
        ByIngredient.display_array(drinks_array)
        puts "---------------------------------------------"
        ByIngredient.another_ingredient_check_intro
        drink_more = ByIngredient.another_ingredient_check
      elsif drinks_array.length == 1
        return ByIngredient.choose_drink(drinks_array)
      else
        puts ""
        puts "------------------------------------------------------"
        puts "Sorry there are no drinks that match those ingredients"
        puts "Please start over with a new ingredient"
        puts "------------------------------------------------------"
        return ByIngredient.lookup_drink_list
      end
    end
    ByIngredient.choose_drink(drinks_array)
  end

# Takes a user input and finds the drinks that are matched with that ingredient
  def self.find_drink_list
    puts ""
    user_input = gets.strip.downcase.titleize.downcase
    if user_input == "exit"
      Use.exit_program
    elsif Ingredient.ingredient_exist(user_input) != nil
      Ingredient.drink_list(user_input)
    else
      puts ""
      puts "----------------------------------------------------------"
      puts "Sorry, that ingredient does not yet exist in our database."
      puts "Please enter another ingredient"
      puts "----------------------------------------------------------"
      ByIngredient.find_drink_list
    end
  end

#prints the choose yo drank banner
  def self.make_a_choice(drinks_array)
    puts "---------------------------------------------------------------------------------"
    puts "Choose yo drank:            (Enter a number between 1 and #{drinks_array.length})"
    puts "---------------------------------------------------------------------------------"
  end

#prints a numbered array of drinks
  def self.display_array_with_number(drinks_array)
    drinks_array.each_with_index do |drink, index|
      puts "#{index + 1}. #{drink.name.titleize}  (#{drink.difficulty.titleize})"
    end
  end

#prints the array of drinks without numbers
  def self.display_array(drinks_array)
    drinks_array.each_with_index do |drink, index|
    puts "#{drink.name.titleize}  (#{drink.difficulty.titleize})"
    end
  end

#chooses a drink and prints it via the Cocktail class
  def self.choose_drink(drinks_array)
    if drinks_array.length < 40
      puts ""
      ByIngredient.make_a_choice(drinks_array)
      ByIngredient.display_array_with_number(drinks_array)
      puts "---------------------------------------------------------------------------------"
    else
      puts ""
      puts "---------------------------------------------------------------------------------"
      ByIngredient.display_array_with_number(drinks_array)
      ByIngredient.make_a_choice(drinks_array)
    end
    puts ""
    user_input = gets.strip.downcase.titleize.downcase
    if user_input == "exit"
      Use.exit_program
    else
      user_input = user_input.downcase.to_i
      if user_input.between?(1, (drinks_array.length))
        Cocktail.print_cocktail(drinks_array[(user_input - 1)].name.downcase)
      else
        puts ""
        puts "-------------------------------------"
        puts "Somebody didn't learn to count to #{drinks_array.length}"
        puts "Please enter a number between 1 and #{drinks_array.length}"
        puts "-------------------------------------"
        ByIngredient.choose_drink(drinks_array)
      end
    end
  end

#intro to checking for another ingredient
  def self.another_ingredient_check_intro
    puts "Would you like to refine by adding another ingredient?"
  end

#checks if the user wants to add a new ingredient
  def self.another_ingredient_check
    puts "------------------------------------------------------"
    puts " • Yes"
    puts " • No"
    puts "------------------------------------------------------"
    puts ""
    user_input = gets.strip.downcase.titleize.downcase
    if user_input == "exit"
      Use.exit_program
    elsif user_input == "yes" || user_input == "y"
      return true
    elsif user_input == "no" || user_input == "n" || user_input == "exit"
      return false
    else
      puts ""
      puts "----------------------------------------------------"
      puts "Can you read? type YES or NO."
      ByIngredient.another_ingredient_check
    end
  end
end
