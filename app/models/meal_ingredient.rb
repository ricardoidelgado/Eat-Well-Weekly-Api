class MealIngredient < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient

  def ingredient
    ingredient = Ingredient.find_by(id: ingredient_id)
  end
end
