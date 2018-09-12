# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :property_theme, optional: true

  has_one :product,
          as: :specific,
          inverse_of: :specific,
          foreign_key: :specific_id,
          dependent: :destroy

  has_one :category, through: :product

  has_many :room_types, dependent: :destroy

  accepts_nested_attributes_for :product

  has_and_belongs_to_many :property_services

  delegate :title, :description, :images, to: :product
end
