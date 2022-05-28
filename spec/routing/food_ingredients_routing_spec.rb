require "rails_helper"

RSpec.describe FoodIngredientsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/food_ingredients").to route_to("food_ingredients#index")
    end

    it "routes to #new" do
      expect(get: "/food_ingredients/new").to route_to("food_ingredients#new")
    end

    it "routes to #show" do
      expect(get: "/food_ingredients/1").to route_to("food_ingredients#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/food_ingredients/1/edit").to route_to("food_ingredients#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/food_ingredients").to route_to("food_ingredients#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/food_ingredients/1").to route_to("food_ingredients#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/food_ingredients/1").to route_to("food_ingredients#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/food_ingredients/1").to route_to("food_ingredients#destroy", id: "1")
    end
  end
end
