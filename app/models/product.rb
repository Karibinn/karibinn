# frozen_string_literal: true

class Product < ApplicationRecord
  SPECIFIC_TYPES = %w[Property Activity].freeze

  include Localizable

  extend FriendlyId
  friendly_id :title_en, use: :slugged

  belongs_to :specific, polymorphic: true
  belongs_to :category
  belongs_to :location

  belongs_to :property, optional: true, foreign_key: :specific_id
  belongs_to :activity, optional: true, foreign_key: :specific_id

  has_many :images, class_name: 'ProductImage'
  has_one :main_image

  accepts_nested_attributes_for :images

  scope :properties, -> { where(specific_type: 'Property') }
  scope :activities, -> { where(specific_type: 'Activity') }

  localizable :title
  localizable :description

  validates :title_en, :title_fr, presence: true, length: { minimum: 5, maximum: 80 }
  validates :description_en, :description_fr, presence: true, length: { minimum: 20 }

  def property?
    specific_type == 'Property'
  end

  def activity?
    specific_type == 'Activity'
  end

  def default_image
    images.first || ProductImage.new
  end

  def build_specific(params = {})
    raise "Unknown specific type #{specific_type}" unless SPECIFIC_TYPES.include?(specific_type)
    self.specific = specific_type.constantize.new(params)
  end

  def price_from
    if property?
      property.room_types.min_by(&:price)&.price || Money.new(0)
    else
      activity.price
    end
  end
end
