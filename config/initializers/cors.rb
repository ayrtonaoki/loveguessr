Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'

    resource '*',
      headers: :any,
      expose: ['Authorization'],  # For token-based auth
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
