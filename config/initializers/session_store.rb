# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bcms_rankings_session',
  :secret      => '7e4d8f8ab3ab4c4867798d7d40b7772e6622803a04265e69ee34181e61a622abb5ef495c59f4c09e9f80356a4408b874af5c8da356db9275a52ce8bde9f75967'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
