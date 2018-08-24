# frozen_string_literal: true

class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploaders :images, ImageUploader

  belongs_to :specific, polymorphic: true

  def property?
    specific_type == 'Property'
  end
end
