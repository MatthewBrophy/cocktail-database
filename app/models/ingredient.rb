class Ingredient < ActiveRecord::Base
  has_many :drinks, through: :ingredient_card
end
