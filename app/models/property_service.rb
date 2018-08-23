class PropertyService < ApplicationRecord
  include Localizable
  localizable :name
end
