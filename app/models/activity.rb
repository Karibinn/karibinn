# frozen_string_literal: true

class Activity < ApplicationRecord
  has_one :product,
          as: :specific,
          inverse_of: :specific,
          foreign_key: :specific_id,
          dependent: :destroy

  accepts_nested_attributes_for :product

  delegate :title, :description, :images, to: :product
end
