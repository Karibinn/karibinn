# frozen_string_literal: true

module BookingItems
  class Activity < BookingItem
    belongs_to :product

    delegate :title, to: :product

    def nights
      0
    end

    def date
      checkin_date.to_date
    end

    # TODO: persist price in `booking_items`
    def price
      product.activity.price * guests
    end

    def property?
      false
    end
  end
end
