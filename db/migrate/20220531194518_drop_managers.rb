class DropManagers < ActiveRecord::Migration[6.1]
  def change
    drop_table :managers
  end
end
