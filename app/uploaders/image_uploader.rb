class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :thumb do
    process resize_to_fill: [300, 300]
  end

  def extension_whitelist
    %w[jpg jpeg]
  end
end
