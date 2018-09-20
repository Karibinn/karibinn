# frozen_string_literal: true

module Bookings
  class Confirm
    def call(personal_information_form, user)
      booking = user.current_booking

      booking.update!(
        state: :confirmed,
        first_name: personal_information_form.first_name,
        last_name: personal_information_form.last_name,
        email: personal_information_form.email,
        phone: personal_information_form.phone,
        country: personal_information_form.country,
        number_of_adults: personal_information_form.number_of_adults,
        number_of_children: personal_information_form.number_of_children
      )

      BookingMailer.confirmation(personal_information_form.email, booking).deliver_later
      BookingMailer.notification(booking).deliver_later
    end
  end
end
