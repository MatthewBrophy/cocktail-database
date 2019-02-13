class Drink < ActiveRecord::Base
  has_many :ingredients, through: :ingredient_card
end
