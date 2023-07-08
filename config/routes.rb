Rails.application.routes.draw do
  # User setup
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  # Ingredients
  get "/ingredients" => "ingredients#index"
  get "/ingredients/:id" => "ingredients#show"
  post "/ingredients" => "ingredients#create"
  patch "/ingredients/:id" => "ingredients#update"
  delete "/ingredients/:id" => "ingredients#destroy"

  # Meals
  get "/meals" => "meals#index"
  get "/meals/:id" => "meals#show"
  post "/meals" => "meals#create"
  patch "/meals/:id" => "meals#update"
  delete "/meals/:id" => "meals#destroy"

  # MealIngredients
  get "/meal_ingredients" => "meal_ingredients#index"
  get "/meal_ingredients/:id" => "meal_ingredients#show"
  post "/meal_ingredients" => "meal_ingredients#create"
  patch "/meal_ingredients/:id" => "meal_ingredients#update"
  delete "/meal_ingredients/:id" => "meal_ingredients#destroy"
end
