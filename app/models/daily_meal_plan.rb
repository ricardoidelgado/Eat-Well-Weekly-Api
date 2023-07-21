class DailyMealPlan < ApplicationRecord
  belongs_to :user

  def breakfast_meal
    Meal.find_by(id: breakfast)
  end

  def breakfast_nutrition
    breakfast_meal.nutritional_summary
  end

  def lunch_meal
    Meal.find_by(id: lunch)
  end

  def lunch_nutrition
    lunch_meal.nutritional_summary
  end

  def dinner_meal
    Meal.find_by(id: dinner)
  end

  def dinner_nutrition
    dinner_meal.nutritional_summary
  end

  def meals
    daily_meals = []
    daily_meals << breakfast_meal
    daily_meals << lunch_meal
    daily_meals << dinner_meal
  end

  def grocery_list
    ingredients_hash = {}
    output = []
    meals.each do |meal|
      MealIngredient.where(meal_id: meal.id).each do |meal_ingredient|
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
      MealIngredient.where(meal_id: meal.id).each do |meal_ingredient|
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
