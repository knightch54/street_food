class FoodOrder < ApplicationRecord
  belongs_to :order
  belongs_to :food
  has_many :food_additional_ingredient_orders, dependent: :destroy
end
