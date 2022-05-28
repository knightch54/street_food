require 'rails_helper'

RSpec.describe "food_ingredients/new", type: :view do
  before(:each) do
    assign(:food_ingredient, FoodIngredient.new(
      ingredient_id: 1,
      food_id: 1
    ))
  end

  it "renders new food_ingredient form" do
    render

    assert_select "form[action=?][method=?]", food_ingredients_path, "post" do

      assert_select "input[name=?]", "food_ingredient[ingredient_id]"

      assert_select "input[name=?]", "food_ingredient[food_id]"
    end
  end
end
