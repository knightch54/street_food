require 'rails_helper'

RSpec.describe "chefs/new", type: :view do
  before(:each) do
    assign(:chef, Chef.new())
  end

  it "renders new chef form" do
    render

    assert_select "form[action=?][method=?]", chefs_path, "post" do
    end
  end
end
