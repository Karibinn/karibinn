# frozen_string_literal: true

class Category < ApplicationRecord
  include Localizable
  localizable :name

  scope :for_class, ->(class_name) { where(object_type: class_name) }

  has_many :objects
end
