class CreateChefOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :chef_orders do |t|
      t.integer :order_id
      t.integer :user_id

      t.timestamps
    end
  end
end
