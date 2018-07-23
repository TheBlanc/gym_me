ENV['RAILS_ENV'] ||= 'test'

# Regular test setup
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'factory_bot'

class ActiveSupport::TestCase

  include FactoryBot::Syntax::Methods

end
