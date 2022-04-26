require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:user) { FactoryBot.create :user }
  let(:order_params) { FactoryBot.attributes_for(:order, user: user).stringify_keys }
  let(:order) { FactoryBot.create(:order, user: user) }
  # let(:orders) { FactoryBot.create_list(:order) }

  describe "GET /index" do
    it "returns http success" do
      get "/orders"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    before do
      allow(Order).to receive(:find).and_return order
    end

    it "returns http success" do
      get "/orders/show"
      expect(response).to have_http_status(:success)
    end

    it 'renders :show template' do
      get "/orders/show", params: { id: order.id }
      expect(response).to render_template :show
    end
  end

  context 'with valid attributes' do
    before do
      allow(order).to receive(:update).and_return true
      allow(user).to receive_message_chain(:orders, :find).and_return order
      allow(controller).to receive(:current_user).and_return user
    end
    
    it 'assigns @order' do
      put "/orders/#{order.id}", params: {order: order_params}
      expect(assigns(:order)).not_to be_nil
    end
    
    it 'receives update for @order' do
      put "/orders/#{order.id}", params: {order: order_params.merge({price: 10})}
      # expect(order).to receive(:update).with(order_params.merge({price: 10}))
      expect(response).to redirect_to(order_url(order))
    end
    
    # it 'redirects to order page' do
    #   put "/orders/#{order.id}", params: {order: order_params}
    #   expect(response).to redirect_to order
    # end
    
  end

end
