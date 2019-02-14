
def banner1
puts " _____"
puts "/.---.\\"
puts "|`````|"
puts "\\     /"
puts " `-.-'           ____"
puts "   |    /\\     .'   /\\"
puts " __|__  |K----;    |  |"
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
  user_input = gets.strip
  if user_input == "1"
    learn_a_cocktail
  elsif user_input == "2"
    lookup_drink_list
  elsif user_input == "3"
    describe_ingredient
  elsif user_input == "4"
    surprise_drink_intro_and_randoms
  elsif user_input == "5" || user_input == "exit"
    exit_program
  else
    puts "You may already be too drunk to use this application.  Please make a valid selection"
    get_user_menu_input
  end
end

def learn_a_cocktail
    puts "Please enter the name of the cocktail you would like to learn to make:"
    user_input = gets.strip.downcase
    if user_input == "exit"
      exit_program
    else
      drink_recipe(user_input)
    end
end

def drink_recipe(user_input)
    if Drink.drink_exist(user_input) != nil
      Drink.recipe(user_input)
      run_again?
    else
      puts "Sorry, that drink does not yet exist in our database."
      learn_a_cocktail
    end
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
  puts " • Yes  (return to the main menu)"
  puts " • No   (exit the program)"
  user_input = gets.strip.downcase
  if user_input == "yes" || user_input == "y"
    command_prompt
  elsif user_input == "no" || user_input == "n" || user_input == "exit"
    exit_program
  else
    puts "can you read? type YES or NO."
    re_run
  end
end

def surprise_drink_intro_and_randoms
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
  user_input = gets.strip.downcase
  if user_input == "exit"
    exit_program
  else
    user_input = user_input.downcase.to_i
      if user_input.between?(1, 10)
        drink_recipe(random_drinks[(user_input - 1)].downcase)
      else
        puts "Somebody didn't learn to count to 10"
        puts "Please enter a number between 1 and 10"
        surprise_drink(random_drinks)
      end
  end
end

def lookup_drink_list
  puts "Please enter the name of an ingredient."
  user_input = gets.strip.downcase
  if Ingredient.ingredient_exist(user_input) != nil
    drinks_array = Ingredient.drink_list(user_input)
    drinks_array.each_with_index do |drink, index|
      puts "#{index + 1}. #{drink}"
    end
    run_again?
  else
    puts "Sorry, that ingredient does not yet exist in our database."
    lookup_drink_list
  end
end

def describe_ingredient
  puts "Enter the name of your ingredient"
  user_input = gets.strip.downcase
  if user_input == "exit"
    exit_program
  if Ingredient.ingredient_exist(user_input) != nil
    ingredient = Ingredient.find_by(name: user_input)
    puts ""
    puts ingredient.name.titleize
    puts "--"
    puts ""
    puts ingredient.description
    puts ""
    run_again?
  else
    puts "Sorry, that ingredient does not yet exist in our database."
    describe_ingredient
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