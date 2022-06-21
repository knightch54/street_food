class CreateFoodAdditionalIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :food_additional_ingredients do |t|
      t.integer :food_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
