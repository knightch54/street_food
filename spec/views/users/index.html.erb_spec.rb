require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      FactoryBot.create(:user, name: 'User1', email: 'example1@mail.com'),
      FactoryBot.create(:user, name: 'User2', email: 'example2@mail.com')
    ])
  end

  let(:valid_user) { FactoryBot.create(:user, name: "John", email: "john@gmail.com") }

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "User1".to_s, count: 1
    assert_select "tr>td", text: "example1@mail.com".to_s, count: 1
    assert_select "tr>td", text: "User2".to_s, count: 1
    assert_select "tr>td", text: "example2@mail.com".to_s, count: 1
  end

  it "Show link to main list" do
    assign(:user, valid_user)

    render

    expect(rendered).to match "New"
  end
end
