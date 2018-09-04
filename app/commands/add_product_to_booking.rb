# frozen_string_literal: true

class AddProductToBooking
  def call(booking_form, user)
    booking = Booking.initial.where(user: user).first_or_create

    booking.items.create(
      product: booking_form.product,
      guests: booking_form.guests,
      date_from: booking_form.date_from,
      date_to: booking_form.date_to,
      price_cents: 0 # TODO
    )
  end
end
