class RemoveChefIdFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :chef_id
  end
end
