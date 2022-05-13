class User < ApplicationRecord
  enum role: {client: 0, chef: 1, manager: 2, admin: 3}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_one :chef

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  scope :last_registered, -> { where('created_at > ? and created_at < ?', Date.today - 1.months, Date.today) }

  after_initialize :set_default_role, :if => :new_record?

  def minutes_waiting_for_order
    if orders.in_progress.present?
      ((Time.current - orders.in_progress.last.updated_at) / 1.minutes).to_i
    end
  end

  def chef?
    chef.present?
  end

  def set_default_role
    self.role ||= :client
  end

  def has_any_role?(*args)
    args.any? { |r| self.role == r.to_s }
  end
end
