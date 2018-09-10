# frozen_string_literal: true

module Bookings
  class AddRoomType
    def call(booking_form, user)
      booking = Booking.initial.where(user: user).first_or_create

      booking.items.create(
        room_type: booking_form.room_type,
        guests: booking_form.guests,
        checkin_date: booking_form.checkin_date,
        checkout_date: booking_form.checkout_date,
        price_cents: 0 # TODO
      )
    end
  end
end
