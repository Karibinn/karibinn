# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    user { nil }
    state { 1 }
  end
end
