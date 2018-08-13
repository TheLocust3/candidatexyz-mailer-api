require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MailerApi
  class Application < Rails::Application
    config.load_defaults 5.1

    config.api_only = true

    Jbuilder.key_format camelize: :lower

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'candidatexyz.com', /.+\.candidatexyz.com/, /127.0.0.1:\d+/
        resource '*', headers: :any, methods: :any
      end
    end
  end
end
