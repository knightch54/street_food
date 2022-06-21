require 'rails_helper'

RSpec.describe "ingredients/edit", type: :view do
  before(:each) do
    @ingredient = assign(:ingredient, Ingredient.create!(
      name: "MyString",
      description: "MyString",
      price: 1.5,
      amount: 1
    ))
  end

  it "renders the edit ingredient form" do
    render

    assert_select "form[action=?][method=?]", ingredient_path(@ingredient), "post" do

      assert_select "input[name=?]", "ingredient[name]"

      assert_select "input[name=?]", "ingredient[description]"

      assert_select "input[name=?]", "ingredient[price]"

      assert_select "input[name=?]", "ingredient[amount]"
    end
  end
end
