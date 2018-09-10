# frozen_string_literal: true

class RoomType < ApplicationRecord
  include Localizable

  belongs_to :property

  has_one :product, through: :property

  has_many :equipments, through: :property

  validates :guest_capacity, :bedrooms, :single_beds, :double_beds, :baths,
            numericality: { greater_than: 0, less_than: 30 }

  validates :name_en, :name_fr, presence: true, length: { minimum: 5, maximum: 80 }

  localizable :name

  def price
    46
  end
end
