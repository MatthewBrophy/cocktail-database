class Ingredient < ActiveRecord::Base
  has_many :ingredient_cards
  has_many :drinks, through: :ingredient_cards

  def self.drink_list(ingredient_name)
    ingredient = Ingredient.find_by(name: ingredient_name)
    ingredient.drinks.map { |drink| drink.name }
  end

  def self.drink_exist(ingredient_name)
    if Ingredient.find_by(name: ingredient_name)
      "exists"
    else
      nil
    end
  end

end
