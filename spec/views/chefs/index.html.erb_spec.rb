require 'rails_helper'

RSpec.describe "chefs/index", type: :view do
  before(:each) do
    assign(:chefs, [
      Chef.create!(),
      Chef.create!()
    ])
  end

  it "renders a list of chefs" do
    render
  end
end
