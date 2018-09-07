# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :optimize

  version :thumb do
    process resize_to_fill: [360, 190]
    process :optimize
  end

  def extension_whitelist
    %w[jpg jpeg]
  end

  def default_url
    'https://via.placeholder.com/360x190'
  end

  def optimize
    manipulate! do |img|
      img.strip
      img.combine_options do |c|
        c.quality '90'
        c.depth '8'
        c.interlace 'plane'
      end
    end
  end
end
