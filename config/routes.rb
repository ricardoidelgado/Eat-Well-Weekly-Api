Rails.application.routes.draw do
  # User setup
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  # Ingredients
  get "/ingredients" => "ingredients#index"
  post "/ingredients" => "ingredients#create"
  patch "/ingredients/:id" => "ingredients#update"
  delete "/ingredients/:id" => "ingredients#destroy"
  post "/ingredients_api" => "ingredients#api"

  # Meals
  get "/meals" => "meals#index"
  get "/meals/:id" => "meals#show"
  post "/meals" => "meals#create"
  patch "/meals/:id" => "meals#update"
  delete "/meals/:id" => "meals#destroy"

  # MealIngredients
  post "/meal_ingredients" => "meal_ingredients#create"
  patch "/meal_ingredients/:id" => "meal_ingredients#update"
  delete "/meal_ingredients/:id" => "meal_ingredients#destroy"

  # DailyMealPlans
  get "/daily_meal_plans" => "daily_meal_plans#index"
  get "/daily_meal_plans/:id" => "daily_meal_plans#show"
  post "/daily_meal_plans" => "daily_meal_plans#create"
  patch "/daily_meal_plans/:id" => "daily_meal_plans#update"
  delete "/daily_meal_plans/:id" => "daily_meal_plans#destroy"

  # WeeklyMealPlans
  get "/weekly_meal_plans" => "weekly_meal_plans#index"
  get "/weekly_meal_plans/:id" => "weekly_meal_plans#show"
  post "/weekly_meal_plans" => "weekly_meal_plans#create"
  patch "/weekly_meal_plans/:id" => "weekly_meal_plans#update"
  delete "/weekly_meal_plans/:id" => "weekly_meal_plans#destroy"

  # Twilio
  # get "/twilio_daily_meal_plans/:id" => "daily_meal_plans#text"
  # get "/twilio_weekly_meal_plans/:id" => "weekly_meal_plans#text"

  # Email
  get "/email_daily_meal_plans/:id" => "daily_meal_plans#email"
  get "/email_weekly_meal_plans/:id" => "weekly_meal_plans#email"
end
