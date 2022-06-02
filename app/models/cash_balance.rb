class CashBalance < ApplicationRecord
  enum status: {open: 0, close: 1}

  belongs_to :chef, class_name: 'User', foreign_key: 'user_id', optional: true

  scope :opened, -> { where(status: 0) }
  scope :closed, -> { where(status: 1) }

  def close
    update_attribute(:status, 1)
    CashBalance.create
  end
end
