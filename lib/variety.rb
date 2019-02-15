class Variety

#provides intro to random drink path
  def self.surprise_drink_intro
    puts ""
    puts "---------------------------------------------------------------------------------"
    puts "Choose yo random drank:                         (Enter a number between 1 and 10)"
    puts "---------------------------------------------------------------------------------"
    random_drinks = Drink.ten_random_drinks
    random_drinks.each_with_index do |drink, i|
      puts "#{i + 1}. #{drink.name.titleize}  (#{drink.difficulty.titleize})"
    end
    puts "---------------------------------------------------------------------------------"
    Variety.surprise_drink(random_drinks)
  end

#takes user input, provides surprise drink, calls on Drink method to print the users choice
  def self.surprise_drink(random_drinks)
    puts ""
    user_input = gets.strip.downcase.titleize.downcase
    if user_input == "exit"
      Use.exit_program
    else
      user_input = user_input.downcase.to_i
      if user_input.between?(1, 10)
        Cocktail.print_cocktail(random_drinks[(user_input - 1)].name.downcase)
      else
        puts ""
        puts "Somebody didn't learn to count to 10"
        puts "Please enter a number between 1 and 10"
        Variety.surprise_drink(random_drinks)
      end
    end
  end
end
