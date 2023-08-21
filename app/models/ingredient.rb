class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :meal_ingredients
  has_many :meals, through: :meal_ingredients

  def get_meal_ingredients
    @meal_ingredients = MealIngredient.where(ingredient_id: id)
  end
end
