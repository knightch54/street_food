require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, FactoryBot.create(:user) )
  end

  let(:valid_user) { FactoryBot.create(:user, name: "John", email: "john@gmail.com") }

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[email]"
    end
  end

  it "Show link to main list" do
    assign(:user, valid_user)

    render

    expect(rendered).to match "Back"
  end
end
