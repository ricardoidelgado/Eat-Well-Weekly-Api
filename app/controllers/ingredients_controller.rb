class IngredientsController < ApplicationController
  before_action :authenticate_user

  def index
    @ingredients = current_user.ingredients
    render :index
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
      user_id: current_user.id,
    )

    if @ingredient.valid?
      render :show
    else
      render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.update(
      name: params[:name] || @ingredient.name,
      picture: params[:picture] || @ingredient.picture,
      calories: params[:calories] || @ingredient.calories,
      fat: params[:fat] || @ingredient.fat,
      sodium: params[:sodium] || @ingredient.sodium,
      carbs: params[:carbs] || @ingredient.carbs,
      protein: params[:protein] || @ingredient.protein,
      sugar: params[:sugar] || @ingredient.sugar,
      cholesterol: params[:cholesterol] || @ingredient.cholesterol,
    )

    if @ingredient.valid? && @ingredient.user_id == current_user.id
      render :show
    else
      render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @ingredient = Ingredient.find_by(id: params[:id])
    if @ingredient.user_id == current_user.id
      @ingredient.destroy
      @ingredient.get_meal_ingredients.each do |meal_ingredient|
        meal_ingredient.destroy
      end
      render json: { message: "Ingredient destroyed successfully and all meal ingredient relationships destroyed successfully" }
    else
      render json: { errors: "Only the user that created this ingredient can delete this ingredient" }, status: :unprocessable_entity
    end
  end

  def api
    query = params[:query]
    url = URI.parse("https://api.api-ninjas.com/v1/nutrition?query=" + query)
    api_key = ENV["API_KEY"]

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true # Use SSL/TLS for secure connection

    request = Net::HTTP::Get.new(url)
    request["X-Api-Key"] = api_key

    response = http.request(request)

    if response.code == "200"
      result = JSON.parse(response.body)
      render json: {name: result[0]["name"], calories: result[0]["calories"], fat: result[0]["fat_total_g"], sodium: result[0]["sodium_mg"], carbs: result[0]["carbohydrates_total_g"], protein: result[0]["protein_g"], sugar: result[0]["sugar_g"], cholesterol: result[0]["cholesterol_mg"] }
    else
      puts "Error: " + response.body
    end
  end
end