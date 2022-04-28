require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:chef) { FactoryBot.create :chef }
  let(:user) { FactoryBot.create :user, {chef: chef} }
  let(:order_params) { FactoryBot.attributes_for(:order, user: user).stringify_keys }
  let(:order) { FactoryBot.create(:order, user: user) }

  let(:valid_attributes) {
    {status: 0, price: 25.50, chef_id: 0, user_id: user.id}
  }

  let(:invalid_attributes) {
    {status: 0, price: 0, chef_id: 0}
  }
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
      put "/orders/#{order.id}", params: {order: order_params.merge!({"price" => 10})}
      # expect(order).to receive(:update).with(order_params.merge!({"price" => 10}))
      # expect(order).to receive(:update)
      expect(response).to redirect_to(order_url(order))
    end
    
    # it 'redirects to order page' do
    #   put "/orders/#{order.id}", params: {order: order_params}
    #   expect(response).to redirect_to order
    # end
    
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Order" do
        expect {
          post orders_url, params: {order: valid_attributes}
        }.to change(Order, :count).by(1)
      end

      it "redirects to the created order" do
        post orders_url, params: { order: valid_attributes }
        expect(response).to redirect_to(order_url(Order.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Order" do
        expect {
          post orders_url, params: { order: invalid_attributes }
        }.to change(Order, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post orders_url, params: { order: invalid_attributes }
        # expect(response).to be_successful
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
