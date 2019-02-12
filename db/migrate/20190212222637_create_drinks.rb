class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string    :name
      t.text      :instructions
      t.string    :vessel
      t.string    :category
      t.boolean   :alcoholic
      t.ingteger  :difficulty
      
    
      t.timestamps
    end
    
  end
end
