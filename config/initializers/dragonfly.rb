require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "33e253cb0c2f1c7987d13e2f5d9e7eb09685f9f6f70112ec5991e43c72b9b8db"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
