# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoomBookingForm do
  let(:room_type_id) { 1 }
  let(:guests) { 2 }

  subject do
    described_class.new(room_type_id: room_type_id,
                        date_range_s: date_range_s,
                        guests: guests)
  end

  describe '#checkin_date, #checkout_date' do
    let(:date_range_s) { '04/09/2018 - 09/10/2018' }

    it 'parses checkin_date' do
      expect(subject.checkin_date).to eq Date.parse('04/09/2018')
    end

    it 'parses checkout_date' do
      expect(subject.checkout_date).to eq Date.parse('09/10/2018')
    end
  end
end
