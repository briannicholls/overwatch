require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Overwatch
  class Application < Rails::Application
    
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    # configure moesif for monetization and analytics
    # moesif_options = {
    #   'application_id' => ENV['MOESIF_API_KEY']
    # }
    # moesif_options['identify_user'] = Proc.new { |env, headers, body|
    #   # Add your custom code that returns a string for user id
    #   puts "*** BEARER: ***"
    #   p headers['X-Authorized-User']
    # }
    # config.middleware.use MoesifRack::MoesifMiddleware, moesif_options

  end
end
