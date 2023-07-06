class IngredientsController < ApplicationController
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
    )
    render :show
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
    render :show
  end
end
