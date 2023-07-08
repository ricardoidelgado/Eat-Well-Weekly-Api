class CreateMealIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_ingredients do |t|
      t.integer :meal_id
      t.integer :ingredient_id
      t.integer :ingredient_quantity

      t.timestamps
    end
  end
end
