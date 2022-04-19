require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.create :order }
  # let(:user) { FactoryBot.create :user }

  context 'price validation' do
    it 'is invalid without a price' do
      expect(FactoryBot.build :order, price: nil).not_to be_valid
    end

    it 'is invalid with price <= 0' do
      expect(FactoryBot.build :order, price: 0).not_to be_valid
    end
  end

  context 'test associations' do
    it 'is invalid without a user' do
      expect(FactoryBot.build :order, user: nil).not_to be_valid
    end
  end
end
