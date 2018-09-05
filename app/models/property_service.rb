# frozen_string_literal: true

class PropertyService < ApplicationRecord
  include Localizable
  localizable :name
end
