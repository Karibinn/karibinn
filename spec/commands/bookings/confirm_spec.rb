# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bookings::Confirm do
  let(:user) { create :user }
  let!(:booking) { create(:booking, user: user) }
  let(:personal_information_form) do
    Bookings::PersonalInformationForm.new(
      first_name: 'John',
      last_name: 'Smith',
      country: 'United States',
      phone: '123123123',
      email: 'john.smith@example.com',
      number_of_adults: 2,
      number_of_children: 1
    )
  end

  subject { described_class.new }

  it 'changes booking to confirmed and sends an email', :aggregate_failures do
    expect(BookingMailer).to receive_message_chain(:confirmation, :deliver_later)
    expect(BookingMailer).to receive_message_chain(:notification, :deliver_later)

    subject.call(personal_information_form, user)

    booking.reload

    expect(booking.first_name).to eq 'John'
    expect(booking.state).to eq 'confirmed'
    expect(booking.last_name).to eq 'Smith'
    expect(booking.country).to eq 'United States'
    expect(booking.phone).to eq '123123123'
    expect(booking.email).to eq 'john.smith@example.com'
    expect(booking.number_of_adults).to eq 2
    expect(booking.number_of_children).to eq 1
  end
end
