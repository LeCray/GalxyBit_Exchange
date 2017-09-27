require_relative 'boot'

require 'rails/all'
require 'dotenv'
Dotenv.load('development.env')



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GalxyCoin
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Rails.application.config.autoload_paths << '#{Rails.root}/app/operations'
  end
end