require 'rails_helper'

RSpec.describe "chefs/show", type: :view do
  before(:each) do
    @chef = assign(:chef, Chef.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
