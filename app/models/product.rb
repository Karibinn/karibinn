# frozen_string_literal: true

class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged


  belongs_to :specific, polymorphic: true
  belongs_to :category

  has_many :images, class_name: 'ProductImage'
  accepts_nested_attributes_for :images

  scope :properties, -> { where(specific_type: 'Property') }
  # TODO: fix later
  scope :experiences, -> { where(specific_type: 'Property') }

  def property?
    specific_type == 'Property'
  end
end
