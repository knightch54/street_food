class FoodOrder < ApplicationRecord
  belongs_to :order
  belongs_to :food
  has_many :food_additional_ingredient_orders, dependent: :destroy

  def ingredients_sum
    sum = {}

    base_ingredients = food.ingredients
    base_ingredients.each do |ingredient|
      sum[ingredient.id] ||= 0
      sum[ingredient.id] += 1
    end
    
    additional_ingredients = food_additional_ingredient_orders
    additional_ingredients.each do |additional_ingredient|
      ingredient = additional_ingredient.ingredient
      sum[ingredient.id] ||= 0
      sum[ingredient.id] += additional_ingredient.quantity
    end

    sum
  end
end
