# frozen_string_literal: true

class RoomType < ApplicationRecord
  include Localizable

  belongs_to :property

  has_one :product, through: :property

  has_and_belongs_to_many :amenities

  validates :guest_capacity, numericality: { greater_than: 0, less_than: 30 }

  validates :bedrooms, :single_beds, :double_beds, :baths,
            numericality: { greater_than_or_equal_to: 0, less_than: 30 }

  validates :name_en, :name_fr, presence: true, length: { minimum: 5, maximum: 80 }

  localizable :name
  localizable :description

  monetize :price_cents
end
