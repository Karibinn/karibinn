class Category < ApplicationRecord
  include Localizable
  localizable :name

  has_many :objects
end
