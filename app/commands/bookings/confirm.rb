# frozen_string_literal: true

module Bookings
  class Confirm
    def call(user)
      booking = user.current_booking

      booking.confirm!

      BookingMailer.confirmation(user, booking).deliver_later
    end
  end
end
