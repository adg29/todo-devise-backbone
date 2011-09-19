# Load the rails application
require File.expand_path('../application', __FILE__)
require 'openssl'

# Initialize the rails application
Todo::Application.initialize!

ActiveRecord::Base.include_root_in_json = false

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE