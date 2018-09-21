# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookingMailer do
  let(:user) { create :user }
  let(:booking) do
    create(:booking, user: user, country: 'US').tap do |b|
      create(:booking_item, :with_room_type, booking: b)
    end
  end

  describe '#confirmation' do
    let(:email) { described_class.confirmation(user, booking) }

    it 'doesnt raise error' do
      expect { email.body }.not_to raise_error
    end
  end

  describe '#notification' do
    let(:email) { described_class.notification(booking) }

    it 'doesnt raise error' do
      expect { email.body }.not_to raise_error
    end

    it 'sends email to the correct person' do
      expect(Rails.application.config)
        .to receive(:booking_notification_email).and_return('bernard@example.com')

      expect(email.to).to eq ['bernard@example.com']
    end
  end
end
