require 'rails_helper'

RSpec.describe "Foods", type: :request do
  let(:food) { FactoryBot.create(:food) }

  describe "GET /index" do
    it "returns http success" do
      get "/dishes"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    before do
      allow(Food).to receive(:find).and_return food
    end

    # it "returns http success" do
    #   get "/foods/show"
    #   expect(response).to have_http_status(:success)
    # end

    # it 'renders :show template' do
    #   get "/foods/show", params: { id: food.id }
    #   expect(response).to render_template :show
    # end
  end
end
