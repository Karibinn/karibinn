# frozen_string_literal: true

CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      use_iam_profile: false,
      region: 'eu-west-3',
      # host: 's3.example.com', # optional
      # endpoint: 'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.storage = :fog
    config.fog_directory = ENV['S3_BUCKET']
    config.asset_host = ENV['CLOUDFRONT_URL']
    config.fog_public = true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  else
    config.storage = :file
  end

  if Rails.env.development?
    config.ignore_integrity_errors = false
    config.ignore_processing_errors = false
    config.ignore_download_errors = false
  end
end
