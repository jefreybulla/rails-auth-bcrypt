require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsAuth
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

  config.action_dispatch.default_headers = {
    'Access-Control-Allow-Origin' => 'https://node-react-2020.herokuapp.com',
    #'Access-Control-Allow-Origin' => 'https://s2.ngrok.io',
    'Access-Control-Allow-Credentials' => 'true',
    'Access-Control-Request-Method' => 'GET'
  }

  end
end
