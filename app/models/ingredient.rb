class Ingredient < ApplicationRecord
  has_many :food_ingredients
  has_many :food_additional_ingredients
  has_many :foods, through: :food_ingredients
end