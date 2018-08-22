class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :property_theme

  has_and_belongs_to_many :property_services
  has_and_belongs_to_many :equipments
end
