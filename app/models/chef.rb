class Chef < ApplicationRecord
  has_many :orders

  def earned_today
    Order.where("chef_id = #{id} AND created_at >= ?", Time.zone.now.beginning_of_day).sum(&:price)
  end
end
