require 'rails_helper'

RSpec.describe "chefs/edit", type: :view do
  before(:each) do
    @chef = assign(:chef, Chef.create!())
  end

  it "renders the edit chef form" do
    render

    assert_select "form[action=?][method=?]", chef_path(@chef), "post" do
    end
  end
end
