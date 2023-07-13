User.create!([
  { first_name: "Test", last_name: "Testerson", email: "test@email.com", profile_picture: "https://images.unsplash.com/photo-1598790006245-77d0b5bd48a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3RvY2slMjBwaG90b3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60", password_digest: "$2a$12$aJh1MRorijh1Dg/h64IHquzwLPsq4tt4arW0VpsEpF8tUXInhVcSO" },
])
Ingredient.create!([
  { name: "1/4 Pound Burger", picture: "https://images.unsplash.com/photo-1587652252980-51fae498d182?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGF0dHl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60", calories: 300, fat: 10, sodium: 200, carbs: 5, protein: 10, sugar: 25, cholesterol: 50, user_id: 1 },
  { name: "Cheese Slice", picture: "https://plus.unsplash.com/premium_photo-1663853491564-5486303ea472?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNoZWVzZSUyMHNsaWNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60", calories: 30, fat: 3, sodium: 10, carbs: 0, protein: 3, sugar: 10, cholesterol: 3, user_id: 1 },
  { name: "Bread", picture: "https://images.unsplash.com/photo-1534620808146-d33bb39128b2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnJlYWR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60", calories: 100, fat: 1, sodium: 23, carbs: 14, protein: 1, sugar: 11, cholesterol: 0, user_id: 1 },
  { name: "Pasta", picture: "https://images.unsplash.com/photo-1551462147-ff29053bfc14?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGFzdGF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60", calories: 300, fat: 1, sodium: 2, carbs: 3, protein: 4, sugar: 5, cholesterol: 6, user_id: 1 },
  { name: "Marinara Sauce", picture: "https://images.unsplash.com/photo-1514516816566-de580c621376?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGFzdGElMjBzYXVjZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60", calories: 10, fat: 11, sodium: 12, carbs: 13, protein: 14, sugar: 15, cholesterol: 16, user_id: 1 },
  { name: "Egg", picture: "https://images.unsplash.com/photo-1587486913049-53fc88980cfc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZWdnc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60", calories: 50, fat: 51, sodium: 52, carbs: 53, protein: 54, sugar: 55, cholesterol: 56, user_id: 1 },
  { name: "Pancake", picture: "https://images.unsplash.com/photo-1544726982-b414d58fabaa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGFuY2FrZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60", calories: 40, fat: 41, sodium: 42, carbs: 43, protein: 44, sugar: 45, cholesterol: 46, user_id: 1 },
  { name: "Avocado", picture: "https://images.unsplash.com/photo-1601039641847-7857b994d704?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXZvY2Fkb3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60", calories: 30, fat: 31, sodium: 32, carbs: 33, protein: 34, sugar: 35, cholesterol: 36, user_id: 1 },
  { name: "Bacon", picture: "https://images.unsplash.com/photo-1606851682837-019baf2e8da4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFjb258ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60", calories: 20, fat: 21, sodium: 22, carbs: 23, protein: 24, sugar: 25, cholesterol: 26, user_id: 1 },
  { name: "Chicken Patty", picture: "https://healthyrecipesblogs.com/wp-content/uploads/2016/09/chicken-patties-featured-2021.jpg", calories: 70, fat: 71, sodium: 72, carbs: 73, protein: 74, sugar: 75, cholesterol: 76, user_id: 1 },
])

Meal.create!([
  { name: "Chicken Parmesan Sandwich", picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm0WB1Z-g8K7rZYXXqpQcQO30GGQyUaW34-w&usqp=CAU", user_id: 1 },
  { name: "Spaghetti", picture: "https://images.unsplash.com/photo-1572441713132-c542fc4fe282?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3BhZ2hldHRpfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60", user_id: 1 },
  { name: "Eggs, Pancakes and Bacon", picture: "https://plus.unsplash.com/premium_photo-1663840277989-be1cf4cc6ab2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZWdncyUyMGFuZCUyMHBhbmNha2VzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60", user_id: 1 },
  { name: "Hamburger", picture: "https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aGFtYnVyZ2VyfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60", user_id: 1 },
  { name: "Avocado Toast", picture: "https://images.unsplash.com/photo-1588137378633-dea1336ce1e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXZvY2FkbyUyMHRvYXN0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60", user_id: 1 },
])

MealIngredient.create!([
  { meal_id: 1, ingredient_id: 2, ingredient_quantity: 1 },
  { meal_id: 1, ingredient_id: 3, ingredient_quantity: 2 },
  { meal_id: 1, ingredient_id: 10, ingredient_quantity: 1 },
  { meal_id: 2, ingredient_id: 4, ingredient_quantity: 10 },
  { meal_id: 2, ingredient_id: 5, ingredient_quantity: 6 },
  { meal_id: 3, ingredient_id: 6, ingredient_quantity: 2 },
  { meal_id: 3, ingredient_id: 7, ingredient_quantity: 3 },
  { meal_id: 3, ingredient_id: 9, ingredient_quantity: 10 },
  { meal_id: 4, ingredient_id: 1, ingredient_quantity: 1 },
  { meal_id: 4, ingredient_id: 3, ingredient_quantity: 2 },
  { meal_id: 4, ingredient_id: 2, ingredient_quantity: 1 },
  { meal_id: 4, ingredient_id: 9, ingredient_quantity: 3 },
  { meal_id: 5, ingredient_id: 3, ingredient_quantity: 2 },
  { meal_id: 5, ingredient_id: 8, ingredient_quantity: 1 },
])

DailyMealPlan.create!([
  { name: "Monday Meals", user_id: 1, breakfast: 3, lunch: 1, dinner: 2 },
  { name: "Breakfast!", user_id: 1, breakfast: 3, lunch: 3, dinner: 3 },
  { name: "Normal Day", user_id: 1, breakfast: 5, lunch: 4, dinner: 2 },
])

WeeklyMealPlan.create!([
  { name: "Normal Week", user_id: 1, sunday: 2, monday: 1, tuesday: 2, wednesday: 3, thursday: 1, friday: 2, saturday: 3 },
])
