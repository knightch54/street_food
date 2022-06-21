class FoodAdditionalIngredientOrder < ApplicationRecord
  belongs_to :ingredient
  belongs_to :food_order
end
