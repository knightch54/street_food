class CreateChefs < ActiveRecord::Migration[6.1]
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :email
      t.float :money

      t.timestamps
    end
  end
end
