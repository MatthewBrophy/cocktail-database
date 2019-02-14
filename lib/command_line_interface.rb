
def banner
puts " _____"
puts "/.---.\\"
puts "|`````|"
puts "\\     /"
puts " `-.-'           ____"
puts "   |    /\\     .'   /\\"
puts " __|__  |K----;    |  |"
puts "`-----` \\/     '.___\\/"
end

def welcome
  puts " "
  puts " "
  puts "-------------------------------------------------------"
  puts "Welcome to the cocktail database.  Let's get you drunk!"
  puts "-------------------------------------------------------"
  puts " "
  puts " "
  banner
  puts " "
  puts " "
  puts " "
end

def command_prompt
  puts "---------------------------------------------------------------------------------"
  puts "Please select from the following options:       (Enter a number between 1 and 4)"
  puts "---------------------------------------------------------------------------------"
  puts "1. Learn how to make a cocktail by name"
  puts "2. Look up a drink list by ingredient"
  puts "3. Find an ingredient's description"
  puts "4. Suprise me!"
  puts "---------------------------------------------------------------------------------"
end

def get_user_menu_input
  user_input = gets.strip
  if user_input == "1"
    learn_a_cocktail
  elsif user_input == "2"
    puts "testy testy 2"
  elsif user_input == "3"
    puts "testy testy 3"
  elsif user_input == "4"
    puts "testy testy 4"
  else
    puts "You may already be too drunk to use this application.  Please make a valid selection"
    get_user_menu_input
  end
end

def learn_a_cocktail
    puts "Please enter the name of the cocktail you would like to learn to make:"
    user_input = gets.strip.downcase
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
  elsif user_input == "no" || user_input == "n"
    puts "Thanks for using the cocktail database! Come back when you want to learn more about booze."
  else
    puts "can you read? type YES or NO."
    re_run
  end
end