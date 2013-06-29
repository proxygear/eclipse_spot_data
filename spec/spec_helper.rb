# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
spec_root = File.expand_path('..', __FILE__)
require File.expand_path("../lib/eclipse_spot_data.rb", spec_root)

require 'pry'
require 'shoulda-matchers'

# FactoryGirl.definition_file_paths = [File.join(spec_root, 'factories')]
# FactoryGirl.find_definitions

#ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
#Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|

end
