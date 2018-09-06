# frozen_string_literal: true

FactoryBot.define do
  factory :booking_item do
    booking nil
    product { create(:product, :with_property) }
    checkin_date '2018-09-03 16:39:20'
    checkout_date '2018-09-03 16:39:20'
    price_cents 1
    guests 1
  end
end
