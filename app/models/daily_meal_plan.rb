class DailyMealPlan < ApplicationRecord
  belongs_to :user

  def breakfast_meal
    Meal.find_by(id: breakfast)
  end

  def lunch_meal
    Meal.find_by(id: lunch)
  end

  def dinner_meal
    Meal.find_by(id: dinner)
  end

  def grocery_list
    hash = {}
    daily_meals = []
    daily_meals << Meal.find_by(id: breakfast)
    daily_meals << Meal.find_by(id: lunch)
    daily_meals << Meal.find_by(id: dinner)
    daily_meals.each do |meal|
      MealIngredient.where(meal_id: meal.id).each do |meal_ingredient|
        ingredient = Ingredient.find_by(id: meal_ingredient.ingredient_id)
        if !hash[ingredient.name]
          hash[ingredient.name] = 0
        end
        hash[ingredient.name] += meal_ingredient.ingredient_quantity
      end
    end
    output = []
    hash.each do |item, quantity|
      output << { item: item, quantity: quantity }
    end
    return output
  end

  # Current output is a hash {bread: 5}, want an array [{item: "Bread"}, {quantity: 5}]

  def nutritional_summary
    output_hash = { calories: 0, fat: 0, sodium: 0, carbs: 0, protein: 0, sugar: 0, cholesterol: 0 }
    daily_meals = []
    daily_meals << Meal.find_by(id: breakfast)
    daily_meals << Meal.find_by(id: lunch)
    daily_meals << Meal.find_by(id: dinner)
    daily_meals.each do |meal|
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
