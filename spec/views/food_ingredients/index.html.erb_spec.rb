require 'rails_helper'

RSpec.describe "food_ingredients/index", type: :view do
  before(:each) do
    assign(:food_ingredients, [
      FoodIngredient.create!(
        ingredient_id: 2,
        food_id: 3
      ),
      FoodIngredient.create!(
        ingredient_id: 2,
        food_id: 3
      )
    ])
  end

  it "renders a list of food_ingredients" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
