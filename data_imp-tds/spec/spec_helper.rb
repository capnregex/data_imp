require 'bundler/setup'
require 'data_imp'
require 'data_imp/tds'

require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Dir[File.join(__dir__, 'shared_examples', '**/*.rb')].each { |f| require f }
