class DropChefs < ActiveRecord::Migration[6.1]
  def change
    drop_table :chefs
  end
end
