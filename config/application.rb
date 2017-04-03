require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Added Middleware due to problem with Puma & Rack when
# submitting Post/Destination form
# resolved by aadding this code from here
# https://github.com/rack/rack/issues/903
# class BadMultipartFormDataSanitizer
#   def initialize(app)
#     @app = app
#   end
#
#   def call(env)
#     if env['CONTENT_TYPE'] =~ /multipart\/form-data/
#       begin
#         Rack::Multipart.parse_multipart(env)
#       rescue EOFError => ex
#         # set content-type to multipart/form-data without the boundary part
#         # to handle the case where empty content is submitted
#         env['CONTENT_TYPE'] = 'multipart/form-data'
#       end
#     end
#
#     @app.call(env)
#   end
# end
# config.assets.initialize_on_precompile = false
# RAILS_ENV=production bundle exec rake assets:precompile


module Travelbook
  class Application < Rails::Application
    # config.middleware.insert_before Rack::Runtime, 'BadMultipartFormDataSanitizer'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
