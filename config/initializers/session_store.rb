# Be sure to restart your server when you modify this file.

# The following works fine in most browsers with the exception of private mode on Chrome and Safari as of 6/8/2020
# It works even if domains are different: set cookie on example.com and use cookie on anotherexample.com
#Rails.application.config.session_store :cookie_store, key: '_rails-auth_session', same_site: 'None', secure: true

# The following works fine in most browsers with the exception of private mode on Safari as of 6/8/2020
# Cookie is set in rails.toro-labs.com and used in subdomain.rails.toro-labs.com
# Production: add secure: true. Require that both websites use SSL. 
# Rails.application.config.session_store :cookie_store, key: '_rails-auth_session', same_site: 'Strict', domain: 'rails.toro-labs.com'

if Rails.env.development?
  Rails.application.config.session_store :cookie_store, key: '_rails-auth_session', same_site: 'Strict', domain: 's1.ngrok.io'
end

if Rails.env.production?
  Rails.application.config.session_store :cookie_store, key: '_rails-auth_session', same_site: 'Strict', domain: 'rails.toro-labs.com'
end