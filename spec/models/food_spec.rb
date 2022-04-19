require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:food) { FactoryBot.create :food }

  context 'check price' do
    it 'is invalid without a price' do
      expect(FactoryBot.build :food, price: nil).not_to be_valid
    end

    it 'is invalid with price <= 0' do
      expect(FactoryBot.build :food, price: 0).not_to be_valid
    end
  end

  context 'check description' do
    it 'is invalid without a description' do
      expect(FactoryBot.build :food, description: nil).not_to be_valid
    end

    it 'valid description' do
      expect(FactoryBot.build :food, description: food.description).to be_valid
    end
  end

  context 'check name' do
    it 'is invalid without a name' do
      expect(FactoryBot.build :food, name: nil).not_to be_valid
    end

    it 'is invalid name length' do
      expect(FactoryBot.build :food, name: "S" * 151).not_to be_valid
    end

    it 'does not allow duplicate name' do
      expect(FactoryBot.build :food, name: food.name).not_to be_valid
    end

    it 'valid name' do
      expect(FactoryBot.build :food, name: Faker::Food.unique.dish).to be_valid
    end
  end
end
