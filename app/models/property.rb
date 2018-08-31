class Property < ApplicationRecord
  belongs_to :property_theme, optional: true

  has_one :product, as: :specific, inverse_of: :specific, foreign_key: 'specific_id'
  has_one :category, through: :product

  accepts_nested_attributes_for :product

  has_and_belongs_to_many :property_services
  has_and_belongs_to_many :equipments

  delegate :title, :description, :images, to: :product
end
