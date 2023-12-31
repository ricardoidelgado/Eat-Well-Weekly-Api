class MealsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @meals = Meal.all
    render :index
  end

  def show
    @meal = Meal.find_by(id: params[:id])
    render :show
  end

  def create
    @meal = Meal.create(
      name: params[:name],
      picture: params[:picture],
      user_id: current_user.id,
    )
    render :show
  end

  def update
    @meal = Meal.find_by(id: params[:id])
    @meal.update(
      name: params[:name] || @meal.name,
      picture: params[:picture] || @meal.picture,
    )
    if @meal.valid? && @meal.user_id == current_user.id
      render :show
    else
      render json: { errors: @meal.errors.full_messages }, status: :unprocessable_entity 
    end
  end

  def destroy
    @meal = Meal.find_by(id: params[:id])
    if @meal.user_id == current_user.id
      @meal.destroy
      @meal.get_meal_ingredients.each do |meal_ingredient|
        meal_ingredient.destroy
      end
      render json: { message: "Meal destroyed successfully and all meal ingredient relationships destroyed successfully" }
    else
      render json: { errors: "Only the user that created this meal can delete this meal"}, status: :unprocessable_entity
    end
  end
end
