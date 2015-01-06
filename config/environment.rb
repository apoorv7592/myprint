# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load heroku vars from local file
env_var = File.join(Rails.root, 'config', 'env_var.rb')
load(env_var) if File.exists?(env_var)

env_var = File.join(Rails.root, 'config', 'env_var.rb')
load(env_var) if File.exists?(env_var)

# Initialize the Rails application.
Rails.application.initialize!
