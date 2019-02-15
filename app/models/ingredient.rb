class Ingredient < ActiveRecord::Base
  has_many :ingredient_cards
  has_many :drinks, through: :ingredient_cards

#provides list of drinks associated with ingredient
  def self.drink_list(ingredient_name)
    ingredient = Ingredient.find_by(name: ingredient_name)
    ingredient.drinks.map { |drink| drink }
  end

#checks to see if ingredient exists, used in multiple classes
  def self.ingredient_exist(ingredient_name)
    if Ingredient.find_by(name: ingredient_name)
      "exists"
    else
      nil
    end
  end
end

#ingredient class and its attributes
