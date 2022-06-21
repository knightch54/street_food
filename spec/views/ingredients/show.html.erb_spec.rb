require 'rails_helper'

RSpec.describe "ingredients/show", type: :view do
  before(:each) do
    @ingredient = assign(:ingredient, Ingredient.create!(
      name: "Name",
      description: "Description",
      price: 2.5,
      amount: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
  end
end
