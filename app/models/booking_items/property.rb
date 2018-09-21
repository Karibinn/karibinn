# frozen_string_literal: true

module BookingItems
  class Property < BookingItem
    belongs_to :booking, inverse_of: :items
    belongs_to :room_type, optional: true


    validates :room_type, presence: true

    def nights
      ((checkout_date - checkin_date).to_f / 1.day).floor
    end

    def price
      room_type.price * nights
    end

    def property?
      true
    end
  end
end
