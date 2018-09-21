# frozen_string_literal: true

module Bookings
  class AddActivity
    def call(booking_form, user)
      booking = Booking.initial.where(user: user).first_or_create

      booking.items.create(
        type: 'BookingItems::Activity',
        product: booking_form.product,
        guests: booking_form.guests,
        checkin_date: booking_form.date,
        checkout_date: booking_form.date,
        price_cents: 0 # TODO
      )
    end
  end
end
