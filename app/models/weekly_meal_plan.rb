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

  def grocery_list
    meal_plans = []
    meals = []
    output_hash = {}
    meal_plans << DailyMealPlan.find_by(id: sunday)
    meal_plans << DailyMealPlan.find_by(id: monday)
    meal_plans << DailyMealPlan.find_by(id: tuesday)
    meal_plans << DailyMealPlan.find_by(id: wednesday)
    meal_plans << DailyMealPlan.find_by(id: thursday)
    meal_plans << DailyMealPlan.find_by(id: friday)
    meal_plans << DailyMealPlan.find_by(id: saturday)
    meal_plans.each do |daily_meal_plan|
      meals << daily_meal_plan.breakfast
      meals << daily_meal_plan.lunch
      meals << daily_meal_plan.dinner
    end
    meals.each do |meal|
      MealIngredient.where(meal_id: meal).each do |meal_ingredient|
        ingredient = Ingredient.find_by(id: meal_ingredient.ingredient_id)
        if !output_hash[ingredient.name]
          output_hash[ingredient.name] = 0
        end
        output_hash[ingredient.name] += meal_ingredient.ingredient_quantity
      end
    end
    return output_hash
  end

  def nutritional_summary
    meal_plans = []
    meals = []
    output_hash = { calories: 0, fat: 0, sodium: 0, carbs: 0, protein: 0, sugar: 0, cholesterol: 0 }
    meal_plans << DailyMealPlan.find_by(id: sunday)
    meal_plans << DailyMealPlan.find_by(id: monday)
    meal_plans << DailyMealPlan.find_by(id: tuesday)
    meal_plans << DailyMealPlan.find_by(id: wednesday)
    meal_plans << DailyMealPlan.find_by(id: thursday)
    meal_plans << DailyMealPlan.find_by(id: friday)
    meal_plans << DailyMealPlan.find_by(id: saturday)
    meal_plans.each do |daily_meal_plan|
      meals << daily_meal_plan.breakfast
      meals << daily_meal_plan.lunch
      meals << daily_meal_plan.dinner
    end
    meals.each do |meal|
      MealIngredient.where(meal_id: meal).each do |meal_ingredient|
        ingredient = Ingredient.find_by(id: meal_ingredient.ingredient_id)
        ingredient_quantity = meal_ingredient.ingredient_quantity
        output_hash[:calories] += ingredient.calories * ingredient_quantity
        output_hash[:fat] += ingredient.fat * ingredient_quantity
        output_hash[:sodium] += ingredient.sodium * ingredient_quantity
        output_hash[:carbs] += ingredient.carbs * ingredient_quantity
        output_hash[:protein] += ingredient.protein * ingredient_quantity
        output_hash[:sugar] += ingredient.sugar * ingredient_quantity
        output_hash[:cholesterol] += ingredient.cholesterol * ingredient_quantity
      end
    end
    return output_hash
  end
end
