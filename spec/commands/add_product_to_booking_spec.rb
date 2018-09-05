# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AddProductToBooking do
  RSpec::Matchers.define :match_booking_form_data do |booking_form|
    match do |booking_item|
      booking_item.product_id == booking_form.product_id &&
        booking_item.guests == booking_form.guests &&
        booking_item.checkin_date == booking_form.checkin_date &&
        booking_item.checkout_date == booking_form.checkout_date
    end
  end

  let(:user) { create :user }
  let(:product) { create :product, :with_property }

  subject { described_class.new }

  context 'when the booking can be made' do
    let(:booking_form) do
      ProductBookingForm.new(
        product_id: product.id,
        guests: 2,
        date_range_s: '2018-08-10 - 2018-08-20'
      )
    end

    context 'when the booking model doesnt yet exist' do
      it 'creates a new booking with a booking item', :aggregate_failures do
        expect { subject.call(booking_form, user) }
          .to change { Booking.count }.by(1)

        booking = Booking.last

        expect(booking.user).to eq user
        expect(booking.items.size).to eq 1
        expect(booking.items.first).to match_booking_form_data(booking_form)
      end
    end

    context 'when the booking model already exists' do
      let!(:booking) do
        create :booking,
               user: user,
               state: state,
               items: [build(:booking_item)]
      end


      context 'in an initial state' do
        let(:state) { :initial }

        it 'doesnt create a new booking' do
          expect { subject.call(booking_form, user) }
            .not_to change { Booking.count }
        end

        it 'adds a booking item to the existing booking' do
          expect { subject.call(booking_form, user) }
            .to change { booking.items.reload.count }.by(1)

          last_item = booking.items.last

          expect(last_item).to match_booking_form_data(booking_form)
        end
      end

      context 'in confirmed state' do
        let(:state) { :confirmed }

        it 'creates a new booking with a booking item', :aggregate_failures do
          expect { subject.call(booking_form, user) }
            .to change { Booking.count }.by(1)

          booking = Booking.last

          expect(booking.user).to eq user
          expect(booking.items.size).to eq 1
          expect(booking.items.first).to match_booking_form_data(booking_form)
        end
      end
    end
  end
end
