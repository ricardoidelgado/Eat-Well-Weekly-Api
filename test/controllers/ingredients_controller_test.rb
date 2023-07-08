require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = User.create(first_name: "Test", last_name: "Testerson", profile_picture: "image.jpeg", email: "test@test.com", password: "password")
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/ingredients.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Ingredient.count, data.length
  end

  test "create" do
    assert_difference "Ingredient.count", 1 do
      post "/ingredients.json", params: { name: "bread", picture: "bread.png", calories: 50, fat: 50, sodium: 50, carbs: 50, protein: 50, sugar: 50, cholesterol: 50 }, headers: { Authorization: "Bearer #{@jwt}" }
      assert_response 200

      post "/ingredients.json", params: { name: "bread", picture: "bread.png", calories: 50, fat: 50, sodium: 50, carbs: 50, protein: 50, sugar: 50, cholesterol: 50 }
      assert_response 401
    end
  end

  test "show" do
    get "/ingredients/#{Ingredient.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "picture", "calories", "fat", "sodium", "carbs", "protein", "sugar", "cholesterol", "user_id"], data.keys
  end

  test "update" do
    ingredient = Ingredient.first
    patch "/ingredients/#{ingredient.id}.json", params: { name: "Updated name" }, headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Ingredient.count", -1 do
      delete "/ingredients/#{Ingredient.first.id}.json", headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
