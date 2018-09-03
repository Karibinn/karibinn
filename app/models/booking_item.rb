class BookingItem < ApplicationRecord
  belongs_to :bookings
  belongs_to :product
end
