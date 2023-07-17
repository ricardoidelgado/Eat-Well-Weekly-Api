class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients

  def get_meal_ingredients
    @meal_ingredients = MealIngredient.where(meal_id: id)
  end

  def nutritional_summary
    output_hash = { calories: 0, fat: 0, sodium: 0, carbs: 0, protein: 0, sugar: 0, cholesterol: 0 }
    MealIngredient.where(meal_id: id).each do |meal_ingredient|
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
    return output_hash
  end
end
