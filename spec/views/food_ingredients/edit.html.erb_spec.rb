require 'rails_helper'

RSpec.describe "food_ingredients/edit", type: :view do
  before(:each) do
    @food_ingredient = assign(:food_ingredient, FoodIngredient.create!(
      ingredient_id: 1,
      food_id: 1
    ))
  end

  it "renders the edit food_ingredient form" do
    render

    assert_select "form[action=?][method=?]", food_ingredient_path(@food_ingredient), "post" do

      assert_select "input[name=?]", "food_ingredient[ingredient_id]"

      assert_select "input[name=?]", "food_ingredient[food_id]"
    end
  end
end
