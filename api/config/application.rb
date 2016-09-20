require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HaccMauiApi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    special_paths = [Rails.root.join('lib')]
    config.autoload_paths   += special_paths
    config.eager_load_paths += special_paths # so Sidekiq will see them
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
      allow do
        origins 'd2p318xtsc4ljf.cloudfront.net', 'hacc2016.s3-website-us-east-1.amazonaws.com', 'hacc-maui-api.herokuapp.com', 'localhost:3000', 'localhost:8675'
        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :put, :patch, :options, :head],
          :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client']
      end
    end
  end
end
