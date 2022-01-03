require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SalonApplication
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

        # CODE YOU SHOULD ADD vvvvvv from - https://stackoverflow.com/questions/57949723/many-default-routes-in-rails-6
        initializer(:remove_action_mailbox_and_activestorage_routes, after: :add_routing_paths) { |app|
          app.routes_reloader.paths.delete_if {|path| path =~ /activestorage/}
          app.routes_reloader.paths.delete_if {|path| path =~ /actionmailbox/ }
        }
        # CODE YOU SHOULD ADD ^^^^^^^^

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
