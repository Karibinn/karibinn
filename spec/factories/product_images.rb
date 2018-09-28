# frozen_string_literal: true

FactoryBot.define do
  factory :product_image do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/image1.jpg')) }
  end
end
