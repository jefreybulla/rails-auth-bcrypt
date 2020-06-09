# Be sure to restart your server when you modify this file.

#Rails.application.config.session_store :cookie_store, key: '_rails-auth_session', same_site: 'None', secure: true

# Production: add secure: true
Rails.application.config.session_store :cookie_store, key: '_rails-auth_session', same_site: 'Lax', domain: 'rails.toro-labs.com'

# To make it work in Chrome Incognito. Cookie is set in s1.ngrok.io and used in subdomain.s1.ngrok.io. 
# Edit config/initializers/session_store.rb accordingly. 
# Rails.application.config.session_store :cookie_store, key: '_rails-auth_session', same_site: ‘<Lax or Strict>', domain: ‘s1.ngrok.io', secure: true