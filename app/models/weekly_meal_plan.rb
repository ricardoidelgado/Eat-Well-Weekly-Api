class WeeklyMealPlan < ApplicationRecord
  belongs_to :user

  def sunday_plan
    DailyMealPlan.find_by(id: sunday)
  end

  def sunday_meals
    sunday_meals = {}
    sunday_meals[:breakfast] = Meal.find_by(id: sunday_plan.breakfast)
    sunday_meals[:lunch] = Meal.find_by(id: sunday_plan.lunch)
    sunday_meals[:dinner] = Meal.find_by(id: sunday_plan.dinner)
    return sunday_meals
  end

  def sunday_nutrition
    sunday_plan.nutritional_summary
  end

  def monday_plan
    DailyMealPlan.find_by(id: monday)
  end

  def monday_meals
    monday_meals = {}
    monday_meals[:breakfast] = Meal.find_by(id: monday_plan.breakfast)
    monday_meals[:lunch] = Meal.find_by(id: monday_plan.lunch)
    monday_meals[:dinner] = Meal.find_by(id: monday_plan.dinner)
    return monday_meals
  end

  def monday_nutrition
    monday_plan.nutritional_summary
  end

  def tuesday_plan
    DailyMealPlan.find_by(id: tuesday)
  end

  def tuesday_meals
    tuesday_meals = {}
    tuesday_meals[:breakfast] = Meal.find_by(id: tuesday_plan.breakfast)
    tuesday_meals[:lunch] = Meal.find_by(id: tuesday_plan.lunch)
    tuesday_meals[:dinner] = Meal.find_by(id: tuesday_plan.dinner)
    return tuesday_meals
  end

  def tuesday_nutrition
    tuesday_plan.nutritional_summary
  end

  def wednesday_plan
    DailyMealPlan.find_by(id: wednesday)
  end

  def wednesday_meals
    wednesday_meals = {}
    wednesday_meals[:breakfast] = Meal.find_by(id: wednesday_plan.breakfast)
    wednesday_meals[:lunch] = Meal.find_by(id: wednesday_plan.lunch)
    wednesday_meals[:dinner] = Meal.find_by(id: wednesday_plan.dinner)
    return wednesday_meals
  end

  def wednesday_nutrition
    wednesday_plan.nutritional_summary
  end

  def thursday_plan
    DailyMealPlan.find_by(id: thursday)
  end

  def thursday_meals
    thursday_meals = {}
    thursday_meals[:breakfast] = Meal.find_by(id: thursday_plan.breakfast)
    thursday_meals[:lunch] = Meal.find_by(id: thursday_plan.lunch)
    thursday_meals[:dinner] = Meal.find_by(id: thursday_plan.dinner)
    return thursday_meals
  end

  def thursday_nutrition
    thursday_plan.nutritional_summary
  end

  def friday_plan
    DailyMealPlan.find_by(id: friday)
  end

  def friday_meals
    friday_meals = {}
    friday_meals[:breakfast] = Meal.find_by(id: friday_plan.breakfast)
    friday_meals[:lunch] = Meal.find_by(id: friday_plan.lunch)
    friday_meals[:dinner] = Meal.find_by(id: friday_plan.dinner)
    return friday_meals
  end

  def friday_nutrition
    friday_plan.nutritional_summary
  end

  def saturday_plan
    DailyMealPlan.find_by(id: saturday)
  end

  def saturday_meals
    saturday_meals = {}
    saturday_meals[:breakfast] = Meal.find_by(id: saturday_plan.breakfast)
    saturday_meals[:lunch] = Meal.find_by(id: saturday_plan.lunch)
    saturday_meals[:dinner] = Meal.find_by(id: saturday_plan.dinner)
    return saturday_meals
  end

  def saturday_nutrition
    saturday_plan.nutritional_summary
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
