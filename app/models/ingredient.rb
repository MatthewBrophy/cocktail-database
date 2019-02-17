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

  def self.most_common_ingredient
    hash = {}
    Ingredient.all.each do |ingredient|
      hash[ingredient.name] = ingredient.ingredient_cards.count
    end
    pp hash.sort_by{|k,v| v}.reverse
  end
end


# def count_difficulties
#   hash = {}
#   i = 0
#   while i < 20
#     hash[i] = 0
#     i += 1
#   end
#   Drink.all.each do |drink|
#     hash[drink.ingredient_cards.count] += 1
#   end
#   puts hash
# end

#ingredient class and its attributes
