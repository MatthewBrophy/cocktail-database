class Ingredient < ActiveRecord::Base
  has_many :ingredient_cards
  has_many :drinks, through: :ingredient_card
end
