class AddNameToWeeklyMealPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :weekly_meal_plans, :name, :string
  end
end
