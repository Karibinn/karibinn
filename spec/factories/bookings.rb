# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    user { nil }
    state { :initial }

    country { 'us' }
    sequence(:first_name) { |n| "FirstName-#{n}" }
    sequence(:last_name) { |n| "LastName-#{n}" }

    trait :with_user do
      user { create(:user) }
    end
  end
end
