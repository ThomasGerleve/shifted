require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Shifted
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :rspec
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.action_view.embed_authenticity_token_in_remote_forms = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.available_locales = %i[en de]
    config.i18n.default_locale = :de
  end
end
