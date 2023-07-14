class WeeklyMealPlansController < ApplicationController
  before_action :authenticate_user

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

  # def text
  #   account_sid = ENV["TWILIO_ACCOUNT_SID"]
  #   auth_token = ENV["TWILIO_AUTH_TOKEN"]
  #   @weekly_meal_plan = WeeklyMealPlan.find_by(id: params[:id])
  #   grocery_list_summary = @weekly_meal_plan.grocery_list
  #   output_message = ""
  #   grocery_list_summary.each do |key, value|
  #     output_message += "\n" + "#{key}: #{value}"
  #   end

  #   @client = Twilio::REST::Client.new account_sid, auth_token
  #   message = @client.messages.create(
  #     body: output_message,
  #     to: ENV["PERSONAL_PHONE_NUMBER"],  # Text this number
  #     from: ENV["TWILIO_PHONE_NUMBER"], # From a valid Twilio number
  #   )

  #   puts message.sid
  # end

  def email
    @weekly_meal_plan = WeeklyMealPlan.find_by(id: params[:id])
    grocery_list_summary = @weekly_meal_plan.grocery_list
    output_message = "#{@weekly_meal_plan.name} Grocery List:"
    grocery_list_summary.each do |key, value|
      output_message += "\n" + "#{key}: #{value}"
    end
    Pony.mail({
      :to => current_user.email,
      :from => ENV["PROJECT_EMAIL"],
      :subject => "Meal Planner - Grocery List",
      :body => output_message,
      :via => :smtp,
      :via_options => {
        :address => "smtp.gmail.com",
        :port => "587",
        :enable_starttls_auto => true,
        :user_name => ENV["PROJECT_EMAIL"],
        :password => ENV["PROJECT_EMAIL_PASSWORD"],
        :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain => "localhost.localdomain", # the HELO domain provided by the client to the server
      },
    })
  end
end
