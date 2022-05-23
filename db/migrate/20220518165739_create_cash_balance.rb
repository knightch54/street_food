class CreateCashBalance < ActiveRecord::Migration[6.1]
  def change
    create_table :cash_balances do |t|
      t.float :sum

      t.timestamps
    end
  end
end
