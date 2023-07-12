class DailyMealPlansController < ApplicationController
  before_action :authenticate_user

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

  def text
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @daily_meal_plan = DailyMealPlan.find_by(id: params[:id])
    grocery_list_summary = @daily_meal_plan.grocery_list
    output_message = ""
    grocery_list_summary.each do |key, value|
      output_message += "\n" + "#{key}: #{value}"
    end

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: output_message,
      to: ENV["PERSONAL_PHONE_NUMBER"],  # Text this number
      from: ENV["TWILIO_PHONE_NUMBER"], # From a valid Twilio number
    )

    puts message.sid
  end
end
