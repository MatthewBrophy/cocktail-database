class UpdateDrinks < ActiveRecord::Migration[5.2]
  def change
    change_column :drinks, :difficulty, :string
  end
end
