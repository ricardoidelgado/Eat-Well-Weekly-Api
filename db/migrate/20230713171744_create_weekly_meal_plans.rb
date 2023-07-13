class CreateWeeklyMealPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :weekly_meal_plans do |t|
      t.string :name
      t.integer :user_id
      t.integer :sunday
      t.integer :monday
      t.integer :tuesday
      t.integer :wednesday
      t.integer :thursday
      t.integer :friday
      t.integer :saturday

      t.timestamps
    end
  end
end
