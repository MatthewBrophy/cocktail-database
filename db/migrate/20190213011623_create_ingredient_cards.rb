class CreateIngredientCards < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_cards do |t|
      t.integer :drink_id
      t.integer :ingredient_id
      t.string :quantity

      t.timestamps
    end
  end
end
