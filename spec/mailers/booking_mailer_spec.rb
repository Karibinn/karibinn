# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookingMailer do
  describe '#confirmation' do
    let(:user) { create :user }
    let(:booking) { create :booking, user: user }
    let(:email) { described_class.confirmation(user, booking) }

    it 'doesnt raise error' do
      expect { email.body }.not_to raise_error
    end
  end

  describe '#notification' do
    let(:booking) { create :booking, :with_user, country: 'US' }
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
