# frozen_string_literal: true

FactoryBot.define do
  factory :room_type do
    sequence(:name_en) { |n| "RoomType-#{n}" }
    sequence(:name_fr) { |n| "RoomType-#{n}" }
    guest_capacity { 2 }
    bedrooms { 1 }
    single_beds { 1 }
    double_beds { 1 }
    baths { 1 }
    price { 150 }

    property
  end
end
