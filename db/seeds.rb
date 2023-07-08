User.create!([
  { first_name: "Test", last_name: "Testerson", email: "test@email.com", profile_picture: "https://images.unsplash.com/photo-1598790006245-77d0b5bd48a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3RvY2slMjBwaG90b3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60", password_digest: "$2a$12$aJh1MRorijh1Dg/h64IHquzwLPsq4tt4arW0VpsEpF8tUXInhVcSO" },
])
Ingredient.create!([
  { name: "1/4 Pound Burger", picture: "https://images.unsplash.com/photo-1587652252980-51fae498d182?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGF0dHl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60", calories: 300, fat: 10, sodium: 200, carbs: 5, protein: 10, sugar: 25, cholesterol: 50, user_id: 1 },
  { name: "Cheese Slice", picture: "https://plus.unsplash.com/premium_photo-1663853491564-5486303ea472?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNoZWVzZSUyMHNsaWNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60", calories: 30, fat: 3, sodium: 10, carbs: 0, protein: 3, sugar: 10, cholesterol: 3, user_id: 1 },
])

Meal.create!([
  { name: "Chicken Parmesan Sandwich", picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm0WB1Z-g8K7rZYXXqpQcQO30GGQyUaW34-w&usqp=CAU", user_id: 1 },
])

MealIngredient.create!([
  { meal_id: 1, ingredient_id: 2, ingredient_quantity: 1 },
])
