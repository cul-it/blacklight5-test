# Be sure to restart your server when you modify this file.

#BlacklightCornell::Application.config.session_store :cookie_store, key: '_blacklightcornell_session'
BlacklightCornell::Application.config.session_store :active_record_store
#ActiveRecord::SessionStore::Session.attr_accessible :data, :session_id
