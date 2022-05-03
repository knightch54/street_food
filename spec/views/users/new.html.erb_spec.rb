require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, FactoryBot.build(:user))
  end

  let(:valid_user) { FactoryBot.create(:user, name: "John", email: "john@gmail.com") }

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password]"
    end
  end

  it "Show link to main list" do
    assign(:user, valid_user)

    render

    expect(rendered).to match "Back"
  end
end
