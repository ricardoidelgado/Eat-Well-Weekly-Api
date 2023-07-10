User.create!([
  { first_name: "Test", last_name: "Testerson", email: "test@email.com", profile_picture: "https://images.unsplash.com/photo-1598790006245-77d0b5bd48a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3RvY2slMjBwaG90b3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60", password_digest: "$2a$12$aJh1MRorijh1Dg/h64IHquzwLPsq4tt4arW0VpsEpF8tUXInhVcSO" },
])
Ingredient.create!([
  { name: "1/4 Pound Burger", picture: "https://images.unsplash.com/photo-1587652252980-51fae498d182?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGF0dHl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60", calories: 300, fat: 10, sodium: 200, carbs: 5, protein: 10, sugar: 25, cholesterol: 50, user_id: 1 },
  { name: "Cheese Slice", picture: "https://plus.unsplash.com/premium_photo-1663853491564-5486303ea472?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNoZWVzZSUyMHNsaWNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60", calories: 30, fat: 3, sodium: 10, carbs: 0, protein: 3, sugar: 10, cholesterol: 3, user_id: 1 },
  { name: "Bread", picture: "https://images.unsplash.com/photo-1534620808146-d33bb39128b2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnJlYWR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60", calories: 100, fat: 1, sodium: 23, carbs: 14, protein: 1, sugar: 11, cholesterol: 0, user_id: 1 },
  { name: "Pasta", picture: "https://images.unsplash.com/photo-1551462147-ff29053bfc14?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGFzdGF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60", calories: 300, fat: 1, sodium: 2, carbs: 3, protein: 4, sugar: 5, cholesterol: 6, user_id: 1 },
  { name: "Marinara Sauce", picture: "https://images.unsplash.com/photo-1514516816566-de580c621376?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGFzdGElMjBzYXVjZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60", calories: 10, fat: 11, sodium: 12, carbs: 13, protein: 14, sugar: 15, cholesterol: 16, user_id: 1 },
])

Meal.create!([
  { name: "Chicken Parmesan Sandwich", picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm0WB1Z-g8K7rZYXXqpQcQO30GGQyUaW34-w&usqp=CAU", user_id: 1 },
  { name: "Spaghetti", picture: "https://images.unsplash.com/photo-1572441713132-c542fc4fe282?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3BhZ2hldHRpfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60", user_id: 1 },
])

MealIngredient.create!([
  { meal_id: 1, ingredient_id: 2, ingredient_quantity: 1 },
  { meal_id: 1, ingredient_id: 3, ingredient_quantity: 2 },
  { meal_id: 2, ingredient_id: 4, ingredient_quantity: 10 },
  { meal_id: 2, ingredient_id: 5, ingredient_quantity: 6 },
])
