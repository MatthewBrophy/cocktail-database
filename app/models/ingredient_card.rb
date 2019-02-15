class IngredientCard < ActiveRecord::Base
  belongs_to :drink
  belongs_to :ingredient
end

#joining class between drink and ingredient
