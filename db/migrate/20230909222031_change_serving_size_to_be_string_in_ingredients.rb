class ChangeServingSizeToBeStringInIngredients < ActiveRecord::Migration[7.0]
  def change
    change_column :ingredients, :serving_size, :string
  end
end
