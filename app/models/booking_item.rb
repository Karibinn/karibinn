class BookingItem < ApplicationRecord
  belongs_to :booking, inverse_of: :items
  belongs_to :product

  def nights
    ((date_to - date_from).to_f / 1.day).floor
  end

  # TODO: fetch price
  def price_cents
    11900
  end

  def price
    price_cents / 100
  end
end
