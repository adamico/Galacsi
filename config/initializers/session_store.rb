# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_galacsi_session',
  :secret      => '8aa272e8a3b8b8a2bd6f252625563a390cc1c103d9e03905795e48bc74e9e59f4b50343f459a58bb7342bbb578b47b27610ba0cd83b3a885c0b3257099242fbd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
