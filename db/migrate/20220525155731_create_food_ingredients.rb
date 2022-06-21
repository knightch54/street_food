class CreateFoodIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :food_ingredients do |t|
      t.integer :ingredient_id
      t.integer :food_id

      t.timestamps
    end
  end
end
