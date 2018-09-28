# frozen_string_literal: true

class Amenity < ApplicationRecord
  include Localizable
  localizable :name

  mount_uploader :icon, IconUploader
end
