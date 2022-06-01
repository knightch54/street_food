require 'rails_helper'

RSpec.describe "cash_balances/index", type: :view do
  before(:each) do
    assign(:cash_balances, [
      CashBalance.create!(),
      CashBalance.create!()
    ])
  end

  it "renders a list of cash_balances" do
    render
  end
end
