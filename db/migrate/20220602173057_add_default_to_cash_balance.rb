class AddDefaultToCashBalance < ActiveRecord::Migration[6.1]
  def change
    change_column_default :cash_balances, :sum, 0
  end
end
