require 'rails_helper'

RSpec.describe "cash_balances/show", type: :view do
  before(:each) do
    @cash_balance = assign(:cash_balance, CashBalance.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
