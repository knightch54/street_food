class AddUserIdToChefs < ActiveRecord::Migration[6.1]
  def change
    add_column :chefs, :user_id, :integer
  end
end
