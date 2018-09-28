# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title_en { 'MyString' }
    title_fr { title_en }
    description_en { 'Lorem Ipsum Dolor Sit Amet Blablabla' }
    description_fr { description_en }

    category
    location

    trait :with_property do
      specific { create :property }
    end

    trait :with_activity do
      specific { create :activity }
    end

    trait :with_image do
      images { [build(:product_image)] }
    end
  end
end
