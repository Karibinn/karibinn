class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :thumb do
    process resize_to_fill: [360, 190]
  end

  def extension_whitelist
    %w[jpg jpeg]
  end

  def default_url
    'https://via.placeholder.com/360x190'
  end
end
