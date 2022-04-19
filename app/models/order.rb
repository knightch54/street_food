class Order < ApplicationRecord
  has_many :food_orders
  belongs_to :user
  belongs_to :chef, optional: true

  validates :price, :numericality => {:greater_than => 0}

  scope :waiting, -> { where(status: 0) }
  scope :in_progress, -> { where(status: 1) }
  scope :completed, -> { where(status: 2) }
end
