class Drink < ActiveRecord::Base
  has_many :ingredient_cards
  has_many :ingredients, through: :ingredient_cards

  def self.recipe(drink_name)
    drink = Drink.find_by(name: drink_name)
    puts drink.name
    puts ""
    puts "Ingredients:"
    puts "------------"
    puts ""
    drink.ingredients.map do |ingredient|
      ingredient_card = IngredientCard.find_by(drink_id: drink.id, ingredient_id: ingredient.id)
      puts ingredient_card.ingredient.name + " " + ingredient_card.measurement
    end
    puts ""
    puts "Instructions:"
    puts "-------------"
    puts drink.instructions
  end

  def self.ten_random_drinks
    drink_array = []
    10.times do
      rando_id = rand(Drink.count)
      drink = Drink.find_by(drink_id: rando_id)
      drink_array << drink.name
    end
  end

  def self.drink_exist(drink_name)
    if Drink.find_by(name: drink_name)
      "exists"
    else
      nil
    end
  end
end
