class Drink < ActiveRecord::Base
  has_many :ingredient_cards
  has_many :ingredients, through: :ingredient_cards

#drink contains the drinks and their attributes

#provides the Variety class with an array of 10 random drinks
  def self.ten_random_drinks
    drink_array = []
    10.times do
      rando_id = rand(1..Drink.count)
      drink = Drink.find_by(id: rando_id)
      drink_array << drink
    end
    drink_array
  end

#checks to see if a drink exists, used in several classes
  def self.drink_exist(drink_name)
    if Drink.find_by(name: drink_name)
      "exists"
    else
      nil
    end
  end
end
