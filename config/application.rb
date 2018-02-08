require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Doaction
    class Application < Rails::Application

        config.generators.javascript_engine = :js
        config.i18n.default_locale = 'pt-BR'
        # Initialize configuration defaults for originally generated Rails version.
        config.load_defaults 5.1

        # Devise login layout
        config.to_prepare do
            Devise::SessionsController.layout "login"
            Devise::RegistrationsController.layout  "login" 
            #Devise::ConfirmationsController.layout "devise"
            #Devise::UnlocksController.layout "devise"            
            Devise::PasswordsController.layout "login"        
        end
        # Settings in config/environments/* take precedence over those specified here.
        # Application configuration should go into files in config/initializers
        # -- all .rb files in that directory are automatically loaded.
    end
end

module Api  
    class Application < Rails::Application
        GrapeDeviseTokenAuth.setup!

        config.paths.add "app/controllers/api", glob: "**/*.rb"
        config.autoload_paths += Dir["#{Rails.root}/app/controllers/api/*"]



        config.middleware.use Rack::Cors do
            allow do
                origins '*'
                resource '*', 
                :headers => :any, :methods => [:get, :post, :options, :create], 
                :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client']
            end
        end
        #config.active_record.raise_in_transactional_callbacks = true
    end
end
