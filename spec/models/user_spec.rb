require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create :user }

  context 'check email' do
    it 'is invalid without an email' do
      expect(FactoryBot.build :user, email: nil).not_to be_valid
    end

    it 'does not allow duplicate emails' do
      expect(FactoryBot.build :user, email: user.email).not_to be_valid
    end

    it 'is invalid email format' do
      expect(FactoryBot.build :user, email: "wrong_format.com").not_to be_valid
    end
  end

  context 'check name' do
    it 'is invalid without a name' do
      expect(FactoryBot.build :user, name: nil).not_to be_valid
    end

    it 'is invalid name length' do
      expect(FactoryBot.build :user, name: "S" * 51).not_to be_valid
    end

    it 'valid name' do
      expect(FactoryBot.build :user, name: user.name).to be_valid
    end
  end

  context 'test associations' do
    it 'has many orders' do
      expect(user).to respond_to :orders
    end

    it 'minutes waiting for order' do
      time_current = Time.zone.parse("2000-01-01 15:42")
      order_created_time = Time.zone.parse("2000-01-01 15:30")
      travel_to(time_current) do
        create(:order, user_id: user.id, status: 1, updated_at: order_created_time)
        expect(user.minutes_waiting_for_order).to eq(12)
      end
    end
  end
end
