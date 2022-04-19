class FoodOrder < ApplicationRecord
  belongs_to :order
  belongs_to :food
end
