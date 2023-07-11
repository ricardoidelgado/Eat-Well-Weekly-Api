class DailyMealPlansController < ApplicationController
  # before_action :authenticate_user

  def index
    @daily_meal_plans = DailyMealPlan.all
    render :index
  end

  def show
    @daily_meal_plan = DailyMealPlan.find_by(id: params[:id])
    render :show
  end

  def create
    @daily_meal_plan = DailyMealPlan.create(
      name: params[:name],
      user_id: current_user.id,
      breakfast: params[:breakfast],
      lunch: params[:lunch],
      dinner: params[:dinner],
    )
    render :show
  end

  def update
    @daily_meal_plan = DailyMealPlan.find_by(id: params[:id])
    @daily_meal_plan.update(
      name: params[:name] || @daily_meal_plan.name,
      breakfast: params[:breakfast] || @daily_meal_plan.breakfast,
      lunch: params[:lunch] || @daily_meal_plan.lunch,
      dinner: params[:dinner] || @daily_meal_plan.dinner,
    )
    render :show
  end

  def destroy
    @daily_meal_plan = DailyMealPlan.find_by(id: params[:id])
    @daily_meal_plan.destroy
    render json: { message: "Daily Meal Plan destroyed successfully" }
  end
end
