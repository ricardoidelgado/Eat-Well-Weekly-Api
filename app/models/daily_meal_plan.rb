class DailyMealPlan < ApplicationRecord
  belongs_to :user

  def breakfast_meal
    meal = Meal.find_by(id: breakfast)
  end

  def lunch_meal
    meal = Meal.find_by(id: lunch)
  end

  def dinner_meal
    meal = Meal.find_by(id: dinner)
  end
end
