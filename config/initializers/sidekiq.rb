Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost', namespace: 'enrollments' }
end
