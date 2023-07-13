class WeeklyMealPlansController < ApplicationController
  # before_action :authenticate_user

  def index
    @weekly_meal_plans = WeeklyMealPlan.all
    render :index
  end

  def show
    @weekly_meal_plan = WeeklyMealPlan.find_by(id: params[:id])
    render :show
  end

  def create
    @weekly_meal_plan = WeeklyMealPlan.create(
      name: params[:name],
      user_id: current_user.id,
      sunday: params[:sunday],
      monday: params[:monday],
      tuesday: params[:tuesday],
      wednesday: params[:wednesday],
      thursday: params[:thursday],
      friday: params[:friday],
      saturday: params[:saturday],
    )
    render :show
  end

  def update
    @weekly_meal_plan = WeeklyMealPlan.find_by(id: params[:id])
    @weekly_meal_plan.update(
      name: params[:name] || @weekly_meal_plan.name,
      sunday: params[:sunday] || @weekly_meal_plan.sunday,
      monday: params[:monday] || @weekly_meal_plan.monday,
      tuesday: params[:tuesday] || @weekly_meal_plan.tuesday,
      wednesday: params[:wednesday] || @weekly_meal_plan.wednesday,
      thursday: params[:thursday] || @weekly_meal_plan.thursday,
      friday: params[:friday] || @weekly_meal_plan.friday,
      saturday: params[:saturday] || @weekly_meal_plan.saturday,
    )
  end

  def destroy
    @weekly_meal_plan = WeeklyMealPlan.find_by(id: params[:id])
    @weekly_meal_plan.destroy
    render json: { message: "Weekly Meal Plan destroyed successfully" }
  end
end
