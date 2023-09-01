class AddServingSizeToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :serving_size, :integer
  end
end
