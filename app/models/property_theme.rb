# frozen_string_literal: true

class PropertyTheme < ApplicationRecord
  include Localizable
  localizable :name
end
