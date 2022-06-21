require 'rails_helper'

RSpec.describe "food_additional_ingredients/edit", type: :view do
  before(:each) do
    @food_additional_ingredient = assign(:food_additional_ingredient, FoodAdditionalIngredient.create!(
      food_id: 1,
      ingredient_id: 1
    ))
  end

  it "renders the edit food_additional_ingredient form" do
    render

    assert_select "form[action=?][method=?]", food_additional_ingredient_path(@food_additional_ingredient), "post" do

      assert_select "input[name=?]", "food_additional_ingredient[food_id]"

      assert_select "input[name=?]", "food_additional_ingredient[ingredient_id]"
    end
  end
end
