# frozen_string_literal: true

class BookingItem < ApplicationRecord
  belongs_to :room_type, optional: true
  belongs_to :booking, inverse_of: :items
  belongs_to :product, optional: true

  delegate :title, to: :product

  def nights
    ((checkout_date - checkin_date).to_f / 1.day).floor
  end
end
