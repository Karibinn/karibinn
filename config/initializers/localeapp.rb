require 'localeapp/rails'

Localeapp.configure do |config|
  config.api_key = ENV['LOCALEAPP_API_KEY']
  config.sending_environments = []
  config.polling_environments << :production
  config.reloading_environments << :production
  config.poll_interval = 60
end

if defined? Rails
  if Rails.env.production?
    Localeapp::CLI::Pull.new.execute
  end
end
