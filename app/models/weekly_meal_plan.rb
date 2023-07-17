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

  def meals
    meal_plans = []
    meals = []
    meal_plans << sunday_plan
    meal_plans << monday_plan
    meal_plans << tuesday_plan
    meal_plans << wednesday_plan
    meal_plans << thursday_plan
    meal_plans << friday_plan
    meal_plans << saturday_plan
    meal_plans.each do |daily_meal_plan|
      meals << daily_meal_plan.breakfast
      meals << daily_meal_plan.lunch
      meals << daily_meal_plan.dinner
    end
    return meals
  end

  def grocery_list
    ingredients_hash = {}
    output = []
    meals.each do |meal|
      MealIngredient.where(meal_id: meal).each do |meal_ingredient|
        ingredient = Ingredient.find_by(id: meal_ingredient.ingredient_id)
        if !ingredients_hash[ingredient.name]
          ingredients_hash[ingredient.name] = 0
        end
        ingredients_hash[ingredient.name] += meal_ingredient.ingredient_quantity
      end
    end
    ingredients_hash.each do |item, quantity|
      output << { item: item, quantity: quantity }
    end
    return output
  end

  def nutritional_summary
    output_hash = { calories: 0, fat: 0, sodium: 0, carbs: 0, protein: 0, sugar: 0, cholesterol: 0 }
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
