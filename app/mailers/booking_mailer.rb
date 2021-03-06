# frozen_string_literal: true

class BookingMailer < ApplicationMailer
  def confirmation(email_to, booking)
    @booking = booking

    mail(
      to: email_to,
      subject: I18n.t('booking_mailer.confirmation.subject', booking_id: booking.id)
    )
  end

  def notification(booking)
    @booking = booking

    mail(
      to: Rails.application.config.booking_notification_email,
      subject: I18n.t('booking_mailer.notification.subject', booking_id: booking.id)
    )
  end
end
