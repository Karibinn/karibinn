# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductBookingForm do
  let(:product_id) { 1 }
  let(:guests) { 2 }

  subject do
    described_class.new(product_id: product_id, date_range_s: date_range_s, guests: guests)
  end

  describe '#date_from, #date_to' do
    let(:date_range_s) { '04/09/2018 - 09/10/2018' }

    it 'parses date_from' do
      expect(subject.date_from).to eq Date.parse('04/09/2018')
    end

    it 'parses date_to' do
      expect(subject.date_to).to eq Date.parse('09/10/2018')
    end
  end
end
