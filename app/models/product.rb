class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :specific, polymorphic: true
end
