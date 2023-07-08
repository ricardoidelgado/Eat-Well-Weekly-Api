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
end
