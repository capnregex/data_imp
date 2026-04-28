require 'bundler/setup'
require 'data_imp'
require 'data_imp/roo'

require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

shared_examples_dir = File.expand_path('../../data_imp/spec/shared_examples', __dir__)
Dir[File.join(shared_examples_dir, '**/*.rb')].each { |f| require f }
