class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :picture
      t.integer :calories
      t.integer :fat
      t.integer :sodium
      t.integer :carbs
      t.integer :protein
      t.integer :sugar
      t.integer :cholesterol

      t.timestamps
    end
  end
end
