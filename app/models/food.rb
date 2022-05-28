class Food < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 150 }
  validates :description, presence: true
  validates :price, :numericality => {:greater_than => 0}

  has_many :food_ingredients
  has_many :ingredients, through: :food_ingredients
end