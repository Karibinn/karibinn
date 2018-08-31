class Activity < ApplicationRecord
  has_one :product, as: :specific, inverse_of: :specific, foreign_key: 'specific_id'
  accepts_nested_attributes_for :product
end
