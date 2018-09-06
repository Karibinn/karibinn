# frozen_string_literal: true

class BookingMailerPreview < ActionMailer::Preview
  def confirmation
    BookingMailer.confirmation(User.first, User.first.current_booking)
  end
end
