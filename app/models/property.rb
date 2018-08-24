class Property < ApplicationRecord
  belongs_to :property_theme

  has_one :product, inverse_of: :specific, foreign_key: 'specific_id'
  has_one :category, through: :product

  has_and_belongs_to_many :property_services
  has_and_belongs_to_many :equipments

  delegate :title, :description, :images, to: :product
end
