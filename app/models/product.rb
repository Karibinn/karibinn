class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :specific, polymorphic: true
end
