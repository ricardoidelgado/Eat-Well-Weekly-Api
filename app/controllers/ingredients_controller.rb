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
end
