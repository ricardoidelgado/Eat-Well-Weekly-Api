class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients

  def get_meal_ingredients
    @meal_ingredients = MealIngredient.where(meal_id: id)
  end
end
