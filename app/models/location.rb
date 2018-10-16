# frozen_string_literal: true

class Location < ApplicationRecord
  include Localizable

  extend FriendlyId
  friendly_id :name_en, use: :slugged

  has_many :products

  scope :with_products, -> { distinct.joins(products: :images) }

  mount_uploader :small_image, ImageUploader
  mount_uploader :large_image, ImageUploader

  validates :name_en, :name_fr, presence: true

  localizable :name
  localizable :description
end
