class Chef < ApplicationRecord
  has_many :orders
  belongs_to :user, optional: true

  def orders_today
    Order.where("chef_id = #{id} AND created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def earned_today
    orders_today.sum(&:price)
  end
end
