
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
  puts "---------------------------------------------------------------------------------"
  puts "Please select from the following options:       (Enter a number between 1 and 4)"
  puts "---------------------------------------------------------------------------------"
  puts "1. Learn how to make a cocktail by name"
  puts "2. Look up a drink list by ingredient"
  puts "3. Find an ingredient's description"
  puts "4. Suprise me!"
  puts "---------------------------------------------------------------------------------"
end

<<<<<<< HEAD
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
    puts "Great choice! Please enter the name of the cocktail you would like to learn to make:"
    user_input = gets.strip.downcase
    Drink.recipe(user_input)
=======
def test_cli
  Drink.recipe("zombie")
>>>>>>> 3ab96c99c6eb3299d27dbddf63ba685d8040e603
end
