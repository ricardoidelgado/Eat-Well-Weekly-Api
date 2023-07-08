class IngredientsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @ingredients = Ingredient.all
    render :index
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
    render :show
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
      render json: {errors: @ingredients.errors.full_messages}, status: unprocessable_entity
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
    if @ingredient.valid?
      render :show
    else
      render json: {errors: @ingredients.errors.full_messages}, status: unprocessable_entity
    end 
  end

  def destroy
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.destroy
    render json: { message: "Ingredient destroyed successfully" }
  end
end
