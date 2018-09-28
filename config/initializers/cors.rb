# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['CLOUDFRONT_URL']

    resource '/assets/*',
             headers: :any,
             methods: [:get]
  end
end
