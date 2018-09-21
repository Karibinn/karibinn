# frozen_string_literal: true

FactoryBot.define do
  factory :property do
    property_theme

    trait :with_product do
      product
    end
  end
end
