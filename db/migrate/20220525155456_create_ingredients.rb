class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string    :name
      t.string    :description
      t.float     :price,          default: 0
      t.integer   :amount,         default: 0

      t.timestamps
    end
  end
end
