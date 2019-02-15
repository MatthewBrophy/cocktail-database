class Cocktail

  def self.learn_a_cocktail_intro
    puts "----------------------------------------------------------------"
    puts "Please the name of the cocktail you would like to learn to make:"
    puts "----------------------------------------------------------------"
    Cocktail.learn_a_cocktail
  end

  def self.learn_a_cocktail
    puts ""
    user_input = gets.strip.downcase.titleize.downcase
    if user_input == "exit"
      Use.exit_program
    else
      Cocktail.check_cocktail(user_input)
    end
  end

  def self.check_cocktail(user_input)
    if Drink.drink_exist(user_input) != nil
      Cocktail.print_cocktail(user_input)
      Use.run_again?
    else
      puts ""
      puts "----------------------------------------------------------------"
      puts "Sorry, that drink does not yet exist in our database."
      puts "Please the name of the cocktail you would like to learn to make:"
      puts "----------------------------------------------------------------"
      Cocktail.learn_a_cocktail
    end
  end

  def self.print_cocktail(user_input)
    drink = Drink.find_by(name: user_input)
    puts ""
    Banner.divider
    puts ""
    if drink.category == "punch / party drink"
      Banner.party
    elsif drink.vessel == "shot glass" || drink.category == "homemade liqueur"
      Banner.shot_glass
    elsif drink.category == "coffee / tea" || drink.vessel == "irish coffee cup" || drink.vessel == "coffee mug"
      Banner.coffee_mug
    elsif drink.vessel == "white wine glass" || drink.vessel == "wine glass" || drink.vessel == "martini glass" || drink.vessel == "champagne flute"
      Banner.wine_glass
    elsif drink.vessel == "highball glass" || drink.category == "milk / float / shake"
      Banner.highball_glass
    else
      Banner.glass
    end
    puts ""
    puts drink.name.upcase
    puts "--"
    puts ""
    puts drink.category.capitalize + " served in a " + drink.vessel
    puts "--"
    puts ""
    puts "Ingredients"
    puts "--"
    puts ""
    drink.ingredients.map do |ingredient|
      ingredient_card = IngredientCard.find_by(drink_id: drink.id, ingredient_id: ingredient.id)
      fixed_measure = ingredient_card.measurement && !ingredient_card.measurement.blank? ? ingredient_card.measurement + " - " : ""
      puts " • " + fixed_measure + ingredient_card.ingredient.name.titleize
    end
    puts ""
    puts "Instructions"
    puts "--"
    puts ""
    puts drink.instructions
    puts ""
    Banner.divider
    Use.run_again?
  end
end
