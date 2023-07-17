json.id meal.id
json.name meal.name
json.picture meal.picture
json.user_id meal.user_id
json.meal_ingredients meal.meal_ingredients do |meal_ingredient|
  json.id meal_ingredient.id
  json.meal_id meal_ingredient.meal_id
  json.ingredient_id meal_ingredient.ingredient_id
  json.ingredient_quantity meal_ingredient.ingredient_quantity
  json.ingredient meal_ingredient.ingredient
end
json.nutritional_summary meal.nutritional_summary
