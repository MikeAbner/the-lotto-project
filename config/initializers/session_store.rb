# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_the-lotto-project-lite_session',
  :secret      => 'f0f11204af3d468d44434f1a4d9bbb9416f007da805b2711d06d0817d70be189b3b91712cde57f010da1e919b95f4a0042e0d82ca2c21ee9f139fd92c2eb408e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
