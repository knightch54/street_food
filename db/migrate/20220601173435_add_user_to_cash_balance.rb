class AddUserToCashBalance < ActiveRecord::Migration[6.1]
  def change
    add_column :cash_balances, :user_id, :integer
    add_column :cash_balances, :status, :integer,    default: 0
  end
end
