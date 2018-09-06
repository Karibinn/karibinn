# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user

  has_many :items, class_name: 'BookingItem', inverse_of: :booking

  enum state: {
    initial: 0,
    confirmed: 4
  }

  def total
    items.sum(&:price_cents) / 100
  end

  def confirm!
    update!(state: :confirmed)
  end
end
