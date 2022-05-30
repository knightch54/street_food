require 'rails_helper'

RSpec.describe "food_additional_ingredients/show", type: :view do
  before(:each) do
    @food_additional_ingredient = assign(:food_additional_ingredient, FoodAdditionalIngredient.create!(
      food_id: 2,
      ingredient_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
