require 'rails_helper'

RSpec.describe "food_additional_ingredients/new", type: :view do
  before(:each) do
    assign(:food_additional_ingredient, FoodAdditionalIngredient.new(
      food_id: 1,
      ingredient_id: 1
    ))
  end

  it "renders new food_additional_ingredient form" do
    render

    assert_select "form[action=?][method=?]", food_additional_ingredients_path, "post" do

      assert_select "input[name=?]", "food_additional_ingredient[food_id]"

      assert_select "input[name=?]", "food_additional_ingredient[ingredient_id]"
    end
  end
end
