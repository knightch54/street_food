require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/food_ingredients", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # FoodIngredient. As you add validations to FoodIngredient, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      FoodIngredient.create! valid_attributes
      get food_ingredients_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      food_ingredient = FoodIngredient.create! valid_attributes
      get food_ingredient_url(food_ingredient)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_food_ingredient_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      food_ingredient = FoodIngredient.create! valid_attributes
      get edit_food_ingredient_url(food_ingredient)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new FoodIngredient" do
        expect {
          post food_ingredients_url, params: { food_ingredient: valid_attributes }
        }.to change(FoodIngredient, :count).by(1)
      end

      it "redirects to the created food_ingredient" do
        post food_ingredients_url, params: { food_ingredient: valid_attributes }
        expect(response).to redirect_to(food_ingredient_url(FoodIngredient.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new FoodIngredient" do
        expect {
          post food_ingredients_url, params: { food_ingredient: invalid_attributes }
        }.to change(FoodIngredient, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post food_ingredients_url, params: { food_ingredient: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested food_ingredient" do
        food_ingredient = FoodIngredient.create! valid_attributes
        patch food_ingredient_url(food_ingredient), params: { food_ingredient: new_attributes }
        food_ingredient.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the food_ingredient" do
        food_ingredient = FoodIngredient.create! valid_attributes
        patch food_ingredient_url(food_ingredient), params: { food_ingredient: new_attributes }
        food_ingredient.reload
        expect(response).to redirect_to(food_ingredient_url(food_ingredient))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        food_ingredient = FoodIngredient.create! valid_attributes
        patch food_ingredient_url(food_ingredient), params: { food_ingredient: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested food_ingredient" do
      food_ingredient = FoodIngredient.create! valid_attributes
      expect {
        delete food_ingredient_url(food_ingredient)
      }.to change(FoodIngredient, :count).by(-1)
    end

    it "redirects to the food_ingredients list" do
      food_ingredient = FoodIngredient.create! valid_attributes
      delete food_ingredient_url(food_ingredient)
      expect(response).to redirect_to(food_ingredients_url)
    end
  end
end
