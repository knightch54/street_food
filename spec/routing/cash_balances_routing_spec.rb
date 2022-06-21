require "rails_helper"

RSpec.describe CashBalancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cash_balances").to route_to("cash_balances#index")
    end

    it "routes to #new" do
      expect(get: "/cash_balances/new").to route_to("cash_balances#new")
    end

    it "routes to #show" do
      expect(get: "/cash_balances/1").to route_to("cash_balances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cash_balances/1/edit").to route_to("cash_balances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cash_balances").to route_to("cash_balances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cash_balances/1").to route_to("cash_balances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cash_balances/1").to route_to("cash_balances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cash_balances/1").to route_to("cash_balances#destroy", id: "1")
    end
  end
end
