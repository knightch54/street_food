require 'rails_helper'

RSpec.describe "cash_balances/new", type: :view do
  before(:each) do
    assign(:cash_balance, CashBalance.new())
  end

  it "renders new cash_balance form" do
    render

    assert_select "form[action=?][method=?]", cash_balances_path, "post" do
    end
  end
end
