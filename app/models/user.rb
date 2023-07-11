class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :ingredients
  has_many :meals
  has_many :daily_meal_plans
end
