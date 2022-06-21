require 'rails_helper'

RSpec.describe "food_ingredients/show", type: :view do
  before(:each) do
    @food_ingredient = assign(:food_ingredient, FoodIngredient.create!(
      ingredient_id: 2,
      food_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
