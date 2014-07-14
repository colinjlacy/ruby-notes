# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Server::Application.config.secret_key_base = 'e81d35791784cd062e8413164eda8f12ec433e13f57476285e6374281230891289a13075ae4d9bed894762d4ad95ed531ea52bba98a2a15a17f0e01dbeb3476c'
