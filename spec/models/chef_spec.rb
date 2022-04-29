require 'rails_helper'

RSpec.describe Chef, type: :model do
  let(:chef) { FactoryBot.create :chef, {user: user} }
  let(:user) { FactoryBot.create :user }

  context 'test associations' do
    it 'has many orders' do
      expect(chef).to respond_to :orders
    end

    it 'earned today' do
      create_list(:order, 3, {user_id: user.id, chef_id: chef.id, status: 2, price: 50, created_at: DateTime.now})
      expect(chef.earned_today).to eq(150)
    end
  end
end
