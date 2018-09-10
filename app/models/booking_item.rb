# frozen_string_literal: true

class BookingItem < ApplicationRecord
  belongs_to :booking, inverse_of: :items
  belongs_to :room_type

  has_one :product, through: :room_type

  delegate :title, to: :product

  validates :room_type, presence: true

  def nights
    ((checkout_date - checkin_date).to_f / 1.day).floor
  end

  # TODO: fetch price
  def price_cents
    11900
  end

  def price
    price_cents / 100
  end
end
