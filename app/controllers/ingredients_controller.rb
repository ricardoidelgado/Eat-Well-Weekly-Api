class IngredientsController < ApplicationController
  before_action :authenticate_user

  def index
    @ingredients = current_user.ingredients
    render :index
  end

  def create
    @ingredient = Ingredient.create(
      name: params[:name],
      picture: params[:picture],
      calories: params[:calories],
      fat: params[:fat],
      sodium: params[:sodium],
      carbs: params[:carbs],
      protein: params[:protein],
      sugar: params[:sugar],
      cholesterol: params[:cholesterol],
      user_id: current_user.id,
    )

    if @ingredient.valid?
      render :show
    else
      render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.update(
      name: params[:name] || @ingredient.name,
      picture: params[:picture] || @ingredient.picture,
      calories: params[:calories] || @ingredient.calories,
      fat: params[:fat] || @ingredient.fat,
      sodium: params[:sodium] || @ingredient.sodium,
      carbs: params[:carbs] || @ingredient.carbs,
      protein: params[:protein] || @ingredient.protein,
      sugar: params[:sugar] || @ingredient.sugar,
      cholesterol: params[:cholesterol] || @ingredient.cholesterol,
    )

    if @ingredient.valid? && @ingredient.user_id == current_user.id
      render :show
    else
      render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @ingredient = Ingredient.find_by(id: params[:id])
    if @ingredient.user_id == current_user.id
      @ingredient.destroy
      @ingredient.get_meal_ingredients.each do |meal_ingredient|
        meal_ingredient.destroy
      end
      render json: { message: "Ingredient destroyed successfully and all meal ingredient relationships destroyed successfully" }
    else
      render json: { errors: "Only the user that created this ingredient can delete this ingredient" }, status: :unprocessable_entity
    end
  end
end
