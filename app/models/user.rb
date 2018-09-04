class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[user admin]

  after_initialize :set_default_role

  has_many :bookings
  has_many :booking_items, through: :bookings, source: :items

  def set_default_role
    return unless new_record?
    self.role ||= :user
  end
end
