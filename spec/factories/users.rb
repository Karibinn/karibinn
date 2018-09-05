# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "email#{i}@example.com" }
    password 'testtest'
    password_confirmation 'testtest'

    trait :admin do
      role :admin
    end
  end
end
