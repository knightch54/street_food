require 'rails_helper'

RSpec.describe "ingredients/new", type: :view do
  before(:each) do
    assign(:ingredient, Ingredient.new(
      name: "MyString",
      description: "MyString",
      price: 1.5,
      amount: 1
    ))
  end

  it "renders new ingredient form" do
    render

    assert_select "form[action=?][method=?]", ingredients_path, "post" do

      assert_select "input[name=?]", "ingredient[name]"

      assert_select "input[name=?]", "ingredient[description]"

      assert_select "input[name=?]", "ingredient[price]"

      assert_select "input[name=?]", "ingredient[amount]"
    end
  end
end
