class Drink < ActiveRecord::Base
  has_many :ingredient_cards
  has_many :ingredients, through: :ingredient_cards

  #has_many :ingredient_cards
end
