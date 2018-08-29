# frozen_string_literal: true

class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged


  belongs_to :specific, polymorphic: true
  belongs_to :category

  has_many :images, class_name: 'ProductImage'
  accepts_nested_attributes_for :images

  scope :properties, -> { where(specific_type: 'Property') }
  scope :activities, -> { where(specific_type: 'Activity') }

  def property?
    specific_type == 'Property'
  end

  def activity?
    specific_type == 'Activity'
  end

  def default_image
    images.first || ProductImage.new
  end
end
