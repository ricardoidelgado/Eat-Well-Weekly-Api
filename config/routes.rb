Rails.application.routes.draw do
  # User setup
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  # Ingredients CRUD
  get "/ingredients" => "ingredients#index"
  get "/ingredients/:id" => "ingredients#show"
  post "/ingredients" => "ingredients#create"
  patch "/ingredients/:id" => "ingredients#update"
end
