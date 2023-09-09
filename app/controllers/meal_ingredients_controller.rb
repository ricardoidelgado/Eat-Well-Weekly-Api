class MealIngredientsController < ApplicationController
  before_action :authenticate_user

  def create
    @meal_ingredient = MealIngredient.create(
      meal_id: params[:meal_id],
      ingredient_id: params[:ingredient_id],
      ingredient_quantity: params[:ingredient_quantity],
    )
    if @meal_ingredient.valid? && Meal.find_by(id: @meal_ingredient.meal_id).user_id == current_user.id
      render :show
    else
      render json: { errors: @meal_ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @meal_ingredient = MealIngredient.find_by(id: params[:id])
    @meal_ingredient.update(
      meal_id: params[:meal_id] || @meal_ingredient.meal_id,
      ingredient_id: params[:ingredient_id] || @meal_ingredient.ingredient_id,
      ingredient_quantity: params[:ingredient_quantity] || @meal_ingredient.ingredient_quantity,
    )
    if @meal_ingredient.valid? && Meal.find_by(id: @meal_ingredient.meal_id).user_id == current_user.id
      render :show
    else
      render json: { errors: @meal_ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @meal_ingredient = MealIngredient.find_by(id: params[:id])
    @meal_ingredient.destroy
    if Meal.find_by(id: @meal_ingredient.meal_id).user_id == current_user.id
      render json: { message: "MealIngredient destroyed sucessfully" }
    else
      render json: { errors: "Only the user that created this meal ingredient can delete this meal ingredient" }, status: :unprocessable_entity
    end
  end
end
