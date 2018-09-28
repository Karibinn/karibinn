# frozen_string_literal: true

class IconUploader < CarrierWave::Uploader::Base
  def extension_whitelist
    %w[svg]
  end

  def default_url
    'https://via.placeholder.com/48x48'
  end
end
