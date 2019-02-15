class ByIngredient

  def self.lookup_drink_list_intro
    puts ""
    puts "---------------------------------------------------------------------------------"
    puts "Please enter the name of an Ingredient:"
    puts "---------------------------------------------------------------------------------"
  end

  def self.lookup_drink_list
    drinks_array = ByIngredient.find_drink_list
    puts ""
    puts "---------------------------------------------"
    drinks_array.each_with_index do |drink, index|
    puts "#{drink.name.titleize}  (#{drink.difficulty.titleize})"
    end
    puts "---------------------------------------------"
    ByIngredient.another_ingredient_check_intro
    drink_more = ByIngredient.another_ingredient_check
    #binding.pry
    while drink_more == true
      ByIngredient.lookup_drink_list_intro
      another_drink_array = ByIngredient.find_drink_list
      drinks_array = drinks_array & another_drink_array
      if drinks_array.length > 1
        puts ""
        puts "---------------------------------------------"
        drinks_array.each_with_index do |drink, index|
        puts "#{drink.name.titleize}  (#{drink.difficulty.titleize})"
        end
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

  def self.choose_drink(drinks_array)
    if drinks_array.length < 40
      puts ""
      puts "---------------------------------------------------------------------------------"
      puts "Choose yo drank:            (Enter a number between 1 and #{drinks_array.length})"
      puts "---------------------------------------------------------------------------------"
      drinks_array.each_with_index do |drink, index|
        puts "#{index + 1}. #{drink.name.titleize}  (#{drink.difficulty.titleize})"
      end
      puts "---------------------------------------------------------------------------------"
    else
      puts ""
      puts "---------------------------------------------------------------------------------"
      drinks_array.each_with_index do |drink, index|
        puts "#{index + 1}. #{drink.name.titleize}  (#{drink.difficulty.titleize})"
      end
      puts "---------------------------------------------------------------------------------"
      puts "Choose yo drank:            (Enter a number between 1 and #{drinks_array.length})"
      puts "---------------------------------------------------------------------------------"
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

  def self.another_ingredient_check_intro
    puts "Would you like to include another ingredient?"
  end


  def self.another_ingredient_check
    puts "---------------------------------------------"
    puts " • Yes"
    puts " • No"
    puts "---------------------------------------------"
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
      puts "---------------------------------------------"
      puts "Can you read? type YES or NO."
      ByIngredient.another_ingredient_check
    end
  end
end
