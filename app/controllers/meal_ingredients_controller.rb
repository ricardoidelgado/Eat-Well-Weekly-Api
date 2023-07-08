class MealIngredientsController < ApplicationController
  def index
    @meal_ingredients = MealIngredient.all
    render :index
  end

  def show
    @meal_ingredient = MealIngredient.find_by(id: params[:id])
    render :show
  end

  def create
    @meal_ingredient = MealIngredient.create(
      meal_id: params[:meal_id],
      ingredient_id: params[:ingredient_id],
      ingredient_quantity: params[:ingredient_quantity],
    )
    render :show
  end

  def update
    @meal_ingredient = MealIngredient.find_by(id: params[:id])
    @meal_ingredient.update(
      meal_id: params[:meal_id] || @meal_ingredient.meal_id,
      ingredient_id: params[:ingredient_id] || @meal_ingredient.ingredient_id,
      ingredient_quantity: params[:ingredient_quantity] || @meal_ingredient.ingredient_quantity,
    )
    render :show
  end

  def destroy
    @meal_ingredient = MealIngredient.find_by(id: params[:id])
    @meal_ingredient.destroy
    render json: { message: "MealIngredient destroyed sucessfully" }
  end
end
