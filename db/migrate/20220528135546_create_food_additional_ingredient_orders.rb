class CreateFoodAdditionalIngredientOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :food_additional_ingredient_orders do |t|
      t.integer :food_order_id
      t.integer :ingredient_id
      t.integer :quantity,         default: 0

      t.timestamps
    end
  end
end
