class Use

  def self.command_prompt
    puts ""
    puts "---------------------------------------------------------------------------------"
    puts "Please select from the following options:       (Enter a number between 1 and 5)"
    puts "---------------------------------------------------------------------------------"
    puts "1. Learn how to make a cocktail by name"
    puts "2. Look up a drink list by ingredient"
    puts "3. Find an ingredient's description"
    puts "4. Suprise me!"
    puts "5. Exit the program       (You may exit the program at any time by typing 'exit')"
    puts "---------------------------------------------------------------------------------"
    Use.get_user_menu_input
  end

  def self.get_user_menu_input
    puts ""
    user_input = gets.strip
    if user_input == "1"
      puts ""
      Cocktail.learn_a_cocktail_intro
    elsif user_input == "2"
      ByIngredient.lookup_drink_list_intro
    elsif user_input == "3"
      Info.describe_ingredient_intro
    elsif user_input == "4"
      Variety.surprise_drink_intro
    elsif user_input == "5" || user_input == "exit"
      Use.exit_program
    else
      puts ""
      puts "------------------------------------------------------------------------------------"
      puts "You may already be too drunk to use this application.  Please make a valid selection"
      puts "------------------------------------------------------------------------------------"
      Use.get_user_menu_input
    end
  end

  def self.exit_program
    puts ""
    puts "--------------------------------------------------------"
    puts "Thank you for using The Cocktail Database! See you soon!"
    puts "Pleaase drnk respoonsibbnily"
    puts "--------------------------------------------------------"
    Banner.banner1
    puts "--------------------------------------------------------"
    puts "--------------------------------------------------------"
    puts ""
    exit
  end

  def self.run_again?
    puts ""
    puts "-------------------------------------------------------"
    puts "Would you like to make another selection from the menu?"
    puts "-------------------------------------------------------"
    Use.re_run
  end

  def self.re_run
    puts " • Yes  (return to the main menu)"
    puts " • No   (exit the program)"
    puts "-------------------------------------------------------"
    puts ""
    user_input = gets.strip.downcase.titleize.downcase
    if user_input == "yes" || user_input == "y"
      Use.command_prompt
    elsif user_input == "no" || user_input == "n" || user_input == "exit"
      Use.exit_program
    else
      puts ""
      puts "-------------------------------------------------------"
      puts "Can you read? type YES or NO."
      puts "-------------------------------------------------------"
      Use.re_run
    end
  end
end
