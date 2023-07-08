class Ingredient < ApplicationRecord
  belongs_to :user
  validates :name, uniqueness: true, presence: true
  has_many :meal_ingredients
  has_many :meals, through: :meal_ingredients
end
