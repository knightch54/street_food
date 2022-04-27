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

RSpec.describe "/chefs", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Chef. As you add validations to Chef, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Chef.create! valid_attributes
      get chefs_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      chef = Chef.create! valid_attributes
      get chef_url(chef)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_chef_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      chef = Chef.create! valid_attributes
      get edit_chef_url(chef)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Chef" do
        expect {
          post chefs_url, params: { chef: valid_attributes }
        }.to change(Chef, :count).by(1)
      end

      it "redirects to the created chef" do
        post chefs_url, params: { chef: valid_attributes }
        expect(response).to redirect_to(chef_url(Chef.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Chef" do
        expect {
          post chefs_url, params: { chef: invalid_attributes }
        }.to change(Chef, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post chefs_url, params: { chef: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested chef" do
        chef = Chef.create! valid_attributes
        patch chef_url(chef), params: { chef: new_attributes }
        chef.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the chef" do
        chef = Chef.create! valid_attributes
        patch chef_url(chef), params: { chef: new_attributes }
        chef.reload
        expect(response).to redirect_to(chef_url(chef))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        chef = Chef.create! valid_attributes
        patch chef_url(chef), params: { chef: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested chef" do
      chef = Chef.create! valid_attributes
      expect {
        delete chef_url(chef)
      }.to change(Chef, :count).by(-1)
    end

    it "redirects to the chefs list" do
      chef = Chef.create! valid_attributes
      delete chef_url(chef)
      expect(response).to redirect_to(chefs_url)
    end
  end
end
