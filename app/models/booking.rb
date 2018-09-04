class Booking < ApplicationRecord
  belongs_to :user

  has_many :items, class_name: 'BookingItem', inverse_of: :booking

  enum state: {
    initial: 0,
    confirmed: 4
  }
end
