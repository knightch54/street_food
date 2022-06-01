class CashBalance < ApplicationRecord
  enum status: {open: 0, close: 1}

  has_one :chef, class_name: 'User', foreign_key: 'user_id'

  def close
    update_attribute(:status, 1)
    CashBalance.create
  end
end
