require 'rails_helper'

RSpec.describe "cash_balances/edit", type: :view do
  before(:each) do
    @cash_balance = assign(:cash_balance, CashBalance.create!())
  end

  it "renders the edit cash_balance form" do
    render

    assert_select "form[action=?][method=?]", cash_balance_path(@cash_balance), "post" do
    end
  end
end
