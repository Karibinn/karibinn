# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bookings::Confirm do
  let(:user) { instance_double(User, current_booking: booking) }
  let(:booking) { instance_double(Booking) }

  subject { described_class.new }

  it 'changes booking to confirmed and sends an email' do
    expect(booking).to receive(:confirm!)
    expect(BookingMailer).to receive_message_chain(:confirmation, :deliver_later)

    subject.call(user)
  end
end
