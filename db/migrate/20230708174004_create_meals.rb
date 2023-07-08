class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :picture
      t.integer :user_id

      t.timestamps
    end
  end
end
