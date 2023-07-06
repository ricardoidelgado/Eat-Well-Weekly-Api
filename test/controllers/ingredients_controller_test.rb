require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "index" do
    get "/ingredients.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Ingredient.count, data.length
  end

  test "create" do
    assert_difference "Ingredient.count", 1 do
      post "/ingredients.json", params: { name: "bread", picture: "bread.png", calories: 50, fat: 50, sodium: 50, carbs: 50, protein: 50, sugar: 50, cholesterol: 50 }
      assert_response 200
    end
  end

  test "show" do
    get "/ingredients/#{Ingredient.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["name", "picture", "calories", "fat", "sodium", "carbs", "protein", "sugar", "cholesterol"], data.keys
  end
end
