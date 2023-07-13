class WeeklyMealPlan < ApplicationRecord
  belongs_to :user

  def sunday_plan
    DailyMealPlan.find_by(id: sunday)
  end

  def monday_plan
    DailyMealPlan.find_by(id: monday)
  end

  def tuesday_plan
    DailyMealPlan.find_by(id: tuesday)
  end

  def wednesday_plan
    DailyMealPlan.find_by(id: wednesday)
  end

  def thursday_plan
    DailyMealPlan.find_by(id: thursday)
  end

  def friday_plan
    DailyMealPlan.find_by(id: friday)
  end

  def saturday_plan
    DailyMealPlan.find_by(id: saturday)
  end
end
