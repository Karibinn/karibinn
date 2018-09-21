# frozen_string_literal: true

FactoryBot.define do
  factory :booking_item do
    booking { nil }
    room_type { nil }
    checkin_date { '2018-09-03 16:39:20' }
    checkout_date { '2018-09-03 16:39:20' }
    price_cents { 1 }
    guests { 1 }
    product { create :product, :with_property }

    trait :with_room_type do
      room_type
    end
  end
end
