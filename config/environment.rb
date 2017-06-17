# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Set Jbuilder default key format
Jbuilder.key_format camelize: :lower
