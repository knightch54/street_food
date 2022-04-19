class User < ApplicationRecord
  has_many :orders

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  scope :last_registered, -> { where('created_at > ? and created_at < ?', Date.today - 1.months, Date.today) }

  def minutes_waiting_for_order
    if orders.in_progress.present?
      ((Time.current - orders.in_progress.last.updated_at) / 1.minutes).to_i
    end
  end
end
