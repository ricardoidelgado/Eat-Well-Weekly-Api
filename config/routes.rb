Rails.application.routes.draw do
  # User setup
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  # Ingredients CRUD
  get "/ingredients" => "ingredients#index"
  post "/ingredients" => "ingredients#create"
end
