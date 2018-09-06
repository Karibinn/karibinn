# frozen_string_literal: true

class BookingMailer < ApplicationMailer
  def confirmation(user, booking)
    @booking = booking

    mail(
      to: user.email,
      subject: I18n.t('booking_mailer.confirmation.subject', booking_id: booking.id)
    )
  end
end
