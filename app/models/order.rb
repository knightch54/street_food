class Order < ApplicationRecord
  enum status: {waiting: 0, in_progress: 1, completed: 2}

  has_many :food_orders, dependent: :destroy
  has_many :foods, through: :food_orders
  belongs_to :user
  has_one :chef_order, dependent: :destroy
  has_one :chef, through: :chef_order, source: :user

  validates :price, :numericality => {:greater_than => 0}

  scope :waiting, -> { where(status: 0) }
  scope :in_progress, -> { where(status: 1) }
  scope :completed, -> { where(status: 2) }

  def enough_ingredients?
    food_orders.each do |food_order|
      food_order.ingredients_sum.each do |ingredient_id, quantity|
        ingredient = Ingredient.find(ingredient_id)
        return false if ingredient.amount < quantity
      end
    end
    true
  end
end
