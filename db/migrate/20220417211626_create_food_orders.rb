class CreateFoodOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :food_orders do |t|
      t.integer :order_id
      t.integer :user_id
      t.integer :food_id
      t.integer :type

      t.timestamps
    end
  end
end
