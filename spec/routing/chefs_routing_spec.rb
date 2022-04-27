require "rails_helper"

RSpec.describe ChefsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/chefs").to route_to("chefs#index")
    end

    it "routes to #new" do
      expect(get: "/chefs/new").to route_to("chefs#new")
    end

    it "routes to #show" do
      expect(get: "/chefs/1").to route_to("chefs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/chefs/1/edit").to route_to("chefs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/chefs").to route_to("chefs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/chefs/1").to route_to("chefs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/chefs/1").to route_to("chefs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/chefs/1").to route_to("chefs#destroy", id: "1")
    end
  end
end
