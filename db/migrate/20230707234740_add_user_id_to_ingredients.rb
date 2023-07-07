class AddUserIdToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :user_id, :integer
  end
end
