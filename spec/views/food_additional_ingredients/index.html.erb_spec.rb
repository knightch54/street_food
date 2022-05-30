require 'rails_helper'

RSpec.describe "food_additional_ingredients/index", type: :view do
  before(:each) do
    assign(:food_additional_ingredients, [
      FoodAdditionalIngredient.create!(
        food_id: 2,
        ingredient_id: 3
      ),
      FoodAdditionalIngredient.create!(
        food_id: 2,
        ingredient_id: 3
      )
    ])
  end

  it "renders a list of food_additional_ingredients" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
