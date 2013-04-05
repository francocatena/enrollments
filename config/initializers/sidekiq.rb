Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost', namespace: 'enrollments' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost', namespace: 'enrollments' }
end
