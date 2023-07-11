class CreateDailyMealPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_meal_plans do |t|
      t.string :name
      t.integer :user_id
      t.integer :breakfast
      t.integer :lunch
      t.integer :dinner

      t.timestamps
    end
  end
end
