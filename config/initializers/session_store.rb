# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_aluguelbom_session',
  :secret      => '6e94b249a286ef674970b47d2ed24d9c810450b2e2b7c17674762dbd53caa663cf22c203ae42fd3cf7ed3f946ba1cfd95d9bb1b30539f9dcd50c6e1560c3f7c0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
