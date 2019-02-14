
def banner1
puts " _____"
puts "/.---.\\"
puts "|`````|"
puts "\\     /"
puts " `-.-'           ____"
puts "   |    /\\     .'   /\\"
puts " __|__  ||----;    |  |"
puts "`-----` \\/     '.___\\/"
end

def banner2
puts " ()   ()      ()    /"
puts "   ()      ()  ()  /"
puts "    ______________/___"
puts "    \\            /   /"
puts "     \\^^^^^^^^^^/^^^/"
puts "      \\     ___/   /"
puts "       \\   (   )  /"
puts "        \\  (___) /"
puts "         \\ /    /"
puts "          \\    /"
puts "           \\  /"
puts "            \\/"
puts "            ||"
puts "            ||"
puts "            ||"
puts "            ||"
puts "            ||"
puts "            /\\"
puts "           /;;\\"
puts "      =============="
end
def welcome
  puts " "
  puts " "
  puts "-------------------------------------------------------"
  puts "Welcome to the cocktail database.  Let's get you drunk!"
  puts "-------------------------------------------------------"
  banner2
  command_prompt
end

def command_prompt
  puts ""
  puts "---------------------------------------------------------------------------------"
  puts "Please select from the following options:       (Enter a number between 1 and 4)"
  puts "---------------------------------------------------------------------------------"
  puts "1. Learn how to make a cocktail by name"
  puts "2. Look up a drink list by ingredient"
  puts "3. Find an ingredient's description"
  puts "4. Suprise me!"
  puts "5. Exit the program       (You may exit the program at any time by typing 'exit')"
  puts "---------------------------------------------------------------------------------"
  get_user_menu_input
end

def get_user_menu_input
  puts ""
  user_input = gets.strip
  if user_input == "1"
    puts ""
    learn_a_cocktail
  elsif user_input == "2"
    lookup_drink_list_intro
  elsif user_input == "3"
    describe_ingredient_intro
  elsif user_input == "4"
    surprise_drink_intro
  elsif user_input == "5" || user_input == "exit"
    exit_program
  else
    puts ""
    puts "You may already be too drunk to use this application.  Please make a valid selection"
    get_user_menu_input
  end
end

def learn_a_cocktail
    puts "Please the name of the cocktail you would like to learn to make:"
    puts ""
    user_input = gets.strip.downcase.titleize.downcase
    if user_input == "exit"
      exit_program
    else
      check_cocktail(user_input)
    end
end

def check_cocktail(user_input)
    if Drink.drink_exist(user_input) != nil
      print_cocktail(user_input)
      run_again?
    else
      puts ""
      puts "Sorry, that drink does not yet exist in our database."
      learn_a_cocktail
    end
end

def print_cocktail(user_input)
  drink = Drink.find_by(name: user_input)
  puts ""
  puts ""
  puts drink.name.titleize
  puts "--"
  puts ""
  puts "Ingredients"
  puts "--"
  puts ""
  drink.ingredients.map do |ingredient|
    ingredient_card = IngredientCard.find_by(drink_id: drink.id, ingredient_id: ingredient.id)
    fixed_measure = ingredient_card.measurement && !ingredient_card.measurement.blank? ? ingredient_card.measurement + " - " : ""
    puts " • " + fixed_measure + ingredient_card.ingredient.name
  end
  puts ""
  puts "Instructions"
  puts "--"
  puts ""
  puts drink.instructions
  run_again?
end

def run_again?
  puts ""
  puts "-------------------------------------------------------"
  puts "Would you like to make another selection from the menu?"
  puts "-------------------------------------------------------"
  re_run
end

def re_run
  puts ""
  puts ' • Yes  (return to the main menu)'
  puts ' • No   (exit the program)'
  puts ""
  user_input = gets.strip.downcase.titleize.downcase
  if user_input == "yes" || user_input == "y"
    command_prompt
  elsif user_input == "no" || user_input == "n" || user_input == "exit"
    exit_program
  else
    puts ""
    puts "can you read? type YES or NO."
    re_run
  end
end

def surprise_drink_intro
  puts ""
  puts "---------------------------------------------------------------------------------"
  puts "Choose yo drank:                                (Enter a number between 1 and 10)"
  puts "---------------------------------------------------------------------------------"
  random_drinks = Drink.ten_random_drinks
  random_drinks.each_with_index do |drink, i|
    puts "#{i + 1}. #{drink}"
  end
  surprise_drink(random_drinks)
end

def surprise_drink(random_drinks)
  puts ""
  user_input = gets.strip.downcase.titleize.downcase
  if user_input == "exit"
    exit_program
  else
    user_input = user_input.downcase.to_i
      if user_input.between?(1, 10)
        print_cocktail(random_drinks[(user_input - 1)].downcase)
      else
        puts ""
        puts "Somebody didn't learn to count to 10"
        puts "Please enter a number between 1 and 10"
        surprise_drink(random_drinks)
      end
  end
end

def lookup_drink_list_intro
  puts ""
  puts "---------------------------------------------------------------------------------"
  puts "Please enter the name of an Ingredient:"
  puts "---------------------------------------------------------------------------------"
  puts ""
  lookup_drink_list_input
end

def lookup_drink_list_input
  puts ""
  user_input = gets.strip.downcase.titleize.downcase
  if user_input == "exit"
    exit_program
  elsif Ingredient.ingredient_exist(user_input) != nil
    drinks_array = Ingredient.drink_list(user_input)
    puts ""
    puts "---------------------------------------------------------------------------------"
    puts "Choose yo drank:            (Enter a number between 1 and #{drinks_array.length})"
    puts "---------------------------------------------------------------------------------"
    drinks_array.each_with_index do |drink, index|
      puts "#{index + 1}. #{drink}"
    end
    lookup_drink_list(drinks_array)
  else
    puts ""
    puts "Sorry, that ingredient does not yet exist in our database."
    puts "Please enter another ingredient"
    lookup_drink_list_input
  end
end

def lookup_drink_list(drinks_array)
  puts ""
  user_input = gets.strip.downcase.titleize.downcase
  if user_input == "exit"
    exit_program
  else
    user_input = user_input.downcase.to_i
    if user_input.between?(1, (drinks_array.length))
      print_cocktail(drinks_array[(user_input - 1)].downcase)
      run_again?
    else
      puts ""
      puts "Somebody didn't learn to count to #{drinks_array.length}"
      puts "Please enter a number between 1 and #{drinks_array.length}"
      lookup_drink_list(drinks_array)
    end
  end
end


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
    exit_program
  else
    if Ingredient.ingredient_exist(user_input) != nil
      ingredient = Ingredient.find_by(name: user_input)
      puts ""
      puts ingredient.name.titleize
      puts "-----"
      puts ""
      puts ingredient.description
      puts ""
      run_again?
    else
      puts ""
      puts "Sorry, that ingredient does not yet exist in our database."
      describe_ingredient
    end
  end
end

def exit_program
  puts "--------------------------------------------------------"
  puts "Thank you for using The Cocktail Database! See you soon!"
  puts "--------------------------------------------------------"
  banner1
  puts "--------------------------------------------------------"
  puts "--------------------------------------------------------"
  exit
end
