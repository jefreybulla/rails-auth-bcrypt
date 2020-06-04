# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_rails-auth_session', secure: true, same_site: 'None', domain: %w(s1.ngrok.io s2.ngrok.io)